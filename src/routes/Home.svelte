<script lang="ts">
    import { onMount } from "svelte";
    import Post from "../lib/Post.svelte";
    import IntersectionObserver from "svelte-intersection-observer";
    import ScrollToTop from "../lib/ScrollToTop.svelte";
    import type { PostData } from "../models/postdata.model";

    let element: HTMLElement;
    let posts: PostData[] = [];
    let visiblePosts = 3;
    let endOfData = false;
    let loading = false;
    let page = 1;

    async function getPosts() {
        loading = true;
        const newPosts: PostData[] = await fetch(
            `http://localhost:8090/api/collections/posts/records?page=${page}&perPage=${visiblePosts}&skipTotal=1&filter=live_date<=@now&sort=-live_date`
        )
            .then((response) => response.json())
            .then((data) => data.items);

        // If we have reached the end of the available data, don't allow any further calls
        if (newPosts.length === 0) {
            endOfData = true;
            loading = false;
            return;
        }

        posts = [...posts, ...newPosts];
        loading = false;
        page++;
    }

    onMount(async () => {
        await getPosts();
    });

    function handleIntersection() {
        if (!loading && !endOfData) {
            getPosts();
        }
    }
</script>

<main>
    <div class="container">
        {#each posts as post}
            <div>
                <Post data={post} shareableLink={true} />
            </div>
        {/each}

        {#if loading}
            <p>Loading...</p>
        {/if}

        <IntersectionObserver {element} on:intersect={handleIntersection}>
            <div class="lazy-load-trigger" bind:this={element}></div>
        </IntersectionObserver>
    </div>

    <ScrollToTop />
</main>