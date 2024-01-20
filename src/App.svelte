<script lang="ts">
    import svelteLogo from "./assets/svelte.svg";
    import viteLogo from "/vite.svg";
    import SpotifyPlayer from "./lib/SpotifyPlayer.svelte";
    import { onMount } from "svelte";

    let promise: Promise<any>;

    async function getPosts() {
        // promise = fetch("http://127.0.0.1:8090/api/collections/posts/records?page=1&perPage=500&skipTotal=1&filter=live_date<=@now&sort=-live_date")
        promise = fetch(
            "http://127.0.0.1:8090/api/collections/posts/records?page=1&perPage=500&skipTotal=1&sort=-live_date"
        ).then((response) => {
            var r = response.json();

            console.log(r);
            return r;
        });
    }

    onMount(async () => {
        await getPosts();
    });
</script>

<nav>
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
                        <SpotifyPlayer
                            trackId={post.track_id}
                            live_date={post.live_date}
                            description={post.description}
                        />
                    </div>
                {/each}
            {:catch error}
                <p>{error}</p>
            {/await}
        {:else}
            <p>Strange, no posts...</p>
        {/if}
    </div>
</main>

<footer>
    <hr/>
    <p>Inspired by the once fantastic <a href="https://noonpacific.com/"  target="_blank" rel="noreferrer">NOON PACIFIC</a></p>
</footer>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap");
</style>
