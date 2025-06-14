document.addEventListener("DOMContentLoaded", function () {
    function updateTopBarHeight() {
        const topBar = document.querySelector('.topbar');
        const topBarHeight = topBar ? topBar.offsetHeight : 0;

        // 1. Set CSS variable for layout
        document.documentElement.style.setProperty('--topbar-height', `${topBarHeight}px`);

        // 2. Dispatch event for any JS-based listeners (timeline cards, etc)
        document.dispatchEvent(new CustomEvent('topbarHeightUpdated', {
            detail: { topBarHeight }
        }));

        console.log("[topbar.js] --topbar-height set to", topBarHeight);
    }

    updateTopBarHeight();
    window.addEventListener('resize', updateTopBarHeight);
});
