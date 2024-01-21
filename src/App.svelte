<script lang="ts">
    import Post from "./lib/Post.svelte";
    import { onMount } from "svelte";

    let promise: Promise<any>;

    async function getPosts() {
        promise = fetch(
            "api/collections/posts/records?page=1&perPage=500&skipTotal=1&sort=-live_date"
        ).then((response) => response.json());
    }

    onMount(async () => {
        await getPosts();
    });
</script>

<nav>
    <p>A new song everyday at</p>
    <h1>NOON GMT</h1>
</nav>

<main>
    <div class="container">
        {#if promise}
            {#await promise}
                <p>Loading...</p>
            {:then posts}
                {#each posts.items as post}
                    <div>
                        <Post
                            trackId={post.track_id}
                            live_date={post.live_date}
                            description={post.description}
                        />
                    </div>
                {/each}
            {:catch error}
                <p>Something went wrong. So there are no posts...</p>
            {/await}
        {:else}
            <p>Strange, no posts...</p>
        {/if}
    </div>
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
