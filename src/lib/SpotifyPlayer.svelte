<script lang="ts">
    export let trackId: string;
    export let live_date: string;
    export let description: string | null;

    let src = `https://open.spotify.com/embed/track/${trackId}?utm_source=generator`;
    let title = new Date(live_date).toLocaleDateString("en-GB", {
        day: "numeric",
        weekday: "long",
        month: "long",
        year: "numeric",
    });

    // let title = new Date(live_date).toISOString().split('T')[0];

    let betterDate = new Date(live_date).toDateString("YYY-MM-DD");
</script>

<div class="card">
    <iframe
        id = spotify
        title="big-player"
        style="border-radius:12px"
        {src}
        width="100%"
        height="352"
        frameBorder="0"
        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
        loading="lazy"
    ></iframe>

    <div>
        <h2>{title}</h2>
        <!-- <h2><u>{title}</u></h2> -->
    </div>

    {#if description}
        <div>
            <p style="text-align:center">- "<em>{description}</em>"</p>
        </div>
    {/if}
</div>

<style>
</style>
