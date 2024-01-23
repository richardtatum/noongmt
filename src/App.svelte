<script lang="ts">
    import { onMount } from "svelte";
    import Post from "./lib/Post.svelte";
    import IntersectionObserver from "svelte-intersection-observer";
    import ScrollToTop from "./lib/ScrollToTop.svelte";

    class PostData {
        track_id!: string;
        description: string | undefined;
        live_date!: string;
    }

    let posts: PostData[] = [];
    let visiblePosts = 3;
    let endOfData = false;
    let loading = false;
    let page = 1;

    async function getPosts() {
        loading = true;
        const newPosts: PostData[] = await fetch(
            `api/collections/posts/records?page=${page}&perPage=${visiblePosts}&skipTotal=1&filter=live_date<=@now&sort=-live_date`
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

    let element: HTMLElement;
    function handleIntersection() {
        if (!loading && !endOfData) {
            getPosts();
        }
    }
</script>

<nav>
    <p>A new song everyday at</p>
    <h1>NOON GMT</h1>
</nav>

<main>
    <div class="container">
        {#each posts as post}
            <div>
                <Post
                    trackId={post.track_id}
                    live_date={post.live_date}
                    description={post.description}
                />
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

<footer>
    <hr />
    <p>
        Inspired by the once fantastic <a
            href="https://noonpacific.com/"
            target="_blank"
            rel="noreferrer">NOON PACIFIC</a
        >
    </p>
</footer>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap");
</style>
