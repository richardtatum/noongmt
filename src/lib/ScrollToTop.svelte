<script lang="ts">
    let showScrollButton = false;
    const scrollToTop = () => window.scrollTo({ top: 0, behavior: "smooth" });
    window.onscroll = () => (showScrollButton = window.scrollY > 100);
</script>

{#if showScrollButton}
    <button on:click={scrollToTop} class="scroll-to-top">↑</button>
{/if}
