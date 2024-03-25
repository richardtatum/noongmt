<script lang="ts">
    import type { PostData } from "../models/postdata.model";
    import Post from "../lib/Post.svelte";

    export let id: string;

    let loading = false;
    let post: PostData;

    async function getPost(postId: string) {
        loading = true;
        post = await fetch(
            `http://localhost:8090/api/collections/posts/records/${postId}`
        )
            .then((response) => response.json())
        loading = false;
    }

    $: getPost(id);
</script>

<main>
    <div class="container">
        {#if post}
            <div>
                <Post data={post}/>
            </div>
        {/if}

        {#if loading}
            <p>Loading...</p>
        {/if}
    </div>
</main>