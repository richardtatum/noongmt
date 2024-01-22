<script lang="ts">
    export let trackId: string;
    export let live_date: string;
    export let description: string | undefined;

    let src = `https://open.spotify.com/embed/track/${trackId}?utm_source=generator`;
    let title = new Date(live_date).toLocaleDateString("en-GB", {
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
        <h2>{title}</h2>
    </div>

    {#if description}
        <div>
            <p style="text-align:center">- "<em>{description}</em>"</p>
        </div>
    {/if}
</div>

<style>
</style>
