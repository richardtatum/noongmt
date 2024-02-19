<script lang="ts">
    import type { PostData } from "../models/postdata.model";

    export let data: PostData;

    let src = `https://open.spotify.com/embed/track/${data.track_id}?utm_source=generator`;
    let title = new Date(data.live_date).toLocaleDateString("en-GB", {
        day: "numeric",
        weekday: "long",
        month: "long",
        year: "numeric",
    });
</script>

<div class="card">
    <iframe
        id = spotify
        title="big-player"
        {src}
        width="100%"
        height="400px"
        frameBorder="0"
        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
        loading="lazy"
    ></iframe>

    <div>
        <h2 class="title">{title}</h2>
    </div>

    {#if data.description}
        <div>
            <p class="description">- "<em>{data.description}</em>"</p>
        </div>
    {/if}
</div>

<style>
</style>
