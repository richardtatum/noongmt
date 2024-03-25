<script lang="ts">
    import type { PostData } from "../models/postdata.model";
    import Post from "../lib/Post.svelte";
    import { Link } from "svelte-routing";
    import ReturnIcon from "../lib/ReturnIcon.svelte";

    export let id: string;

    let loading = false;
    let post: PostData;

    async function getPost(postId: string) {
        loading = true;
        post = await fetch(
            `api/collections/posts/records/${postId}`
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

    <div class="center">
        <button>
            <Link to="/" style="text-decoration: none;">
                All posts
                <ReturnIcon size={12} />
            </Link>
        </button>
    </div>    
</main>

<style>
    .center {
        text-align: center;
        margin-top: -2rem;
        margin-bottom: 2rem;
    }

    button {
        text-decoration: none;
        border: 0px;
        border-radius: 12px;
        padding: 5px 10px;
    }
</style>