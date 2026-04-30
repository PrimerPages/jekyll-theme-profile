document.addEventListener('DOMContentLoaded', async function () {
  const htmlElement = document.documentElement;

  function getResolvedMermaidTheme() {
    const mode = htmlElement.getAttribute('data-color-mode');

    if (mode === 'dark') return 'dark';
    if (mode === 'light') return 'neutral';

    return window.matchMedia('(prefers-color-scheme: dark)').matches
      ? 'dark'
      : 'neutral';
  }

  function prepareMermaidBlocks() {
    document.querySelectorAll('pre > code.language-mermaid').forEach((code) => {
      const source = code.textContent;
      const container = document.createElement('div');

      container.className = 'mermaid';
      container.dataset.source = source;
      container.textContent = source;

      code.parentElement.replaceWith(container);
    });
  }

  async function renderMermaid() {
    mermaid.initialize({
      startOnLoad: false,
      theme: getResolvedMermaidTheme()
    });

    document.querySelectorAll('.mermaid').forEach((el) => {
      el.removeAttribute('data-processed');
      el.textContent = el.dataset.source;
    });

    await mermaid.run({
      querySelector: '.mermaid'
    });
  }

  prepareMermaidBlocks();
  await renderMermaid();

  const observer = new MutationObserver(renderMermaid);

  observer.observe(htmlElement, {
    attributes: true,
    attributeFilter: ['data-color-mode']
  });

  window
    .matchMedia('(prefers-color-scheme: dark)')
    .addEventListener('change', function () {
      if (htmlElement.getAttribute('data-color-mode') === 'auto') {
        renderMermaid();
      }
    });
});
