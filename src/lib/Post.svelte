<script lang="ts">
    import type { PostData } from "../models/postdata.model";
    import { copy } from 'svelte-copy'
    import LinkIcon from "./LinkIcon.svelte";
    import { onMount } from 'svelte';
    import { Tooltip } from "@svelte-plugins/tooltips";
    
    export let data: PostData;
    export let shareableLink: boolean = false;

    let src = `https://open.spotify.com/embed/track/${data.track_id}`;
    let title = new Date(data.live_date).toLocaleDateString("en-GB", {
        day: "numeric",
        weekday: "long",
        month: "long",
        year: "numeric",
    });

    let url = "";
    onMount(() => {
        url = window.location.href + data.id;
    })

    let tooltipVisible = false;
    function showTooltip() {
        tooltipVisible = true;
        setTimeout(() => {
            tooltipVisible = false;
        }, 1500)
    }

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
        <h2 class="title">
            {title}
            {#if shareableLink}
                <button use:copy={url} on:svelte-copy={() => showTooltip()}>
                    <Tooltip content="Link copied!" action=none show={tooltipVisible} animation=slide>
                        <LinkIcon size={18}/>
                    </Tooltip>
                </button>
            {/if}
        </h2>
    </div>

    {#if data.description}
        <div>
            <p class="description">- "<em>{data.description}</em>"</p>
        </div>
    {/if}
</div>

<style>
    button {
        border: 0px;
        background-color: white;
    }

    button:hover {
        cursor: pointer;
        color: grey;
    }
</style>
