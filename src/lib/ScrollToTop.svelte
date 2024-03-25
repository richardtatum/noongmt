<script lang="ts">
    import ChevronUpIcon from "./ChevronUpIcon.svelte";

    let showScrollButton = false;
    const scrollToTop = () => window.scrollTo({ top: 0, behavior: "smooth" });
    window.onscroll = () => (showScrollButton = window.scrollY > 100);
</script>

{#if showScrollButton}
<div >
    <button on:click={scrollToTop} class="scroll-to-top">
        Back to latest
        <ChevronUpIcon size={12}/>
    </button>
</div>

{/if}

<style>
    button {
        border: 0px;
        border-radius: 12px;
        padding: 5px 10px;
        position: fixed;
        top: 20px;
        cursor: pointer;
        background-color: #e9e9ed;
        color: #555;
        border-radius: 12px;
        left: 50%;
        transform: translateX(-50%);
    }

    button:hover {
        background-color: #d0d0d7;
    }

    @media (max-width: 768px) {
        button {
            top: 10px;
        }
    }
</style>