---
title: Paginator Navigation
category: includes
order: 41
---

The **Paginator Navigation** include file provides a simple and accessible way to navigate paginated content within a Jekyll site. It dynamically generates pagination links for previous and next pages, as well as numbered navigation between multiple pages.

## Usage

To use this include in your Jekyll theme, add the following line to your template:

{% raw %}
```liquid
{% include paginator_nav.html %}
```
{% endraw %}

You must also have [`pagination`](../plugins/pagination.md) installed.

## Parameters

This include can be customized by passing in the following optional parameters:

| Parameter            | Default                        | Description |
|----------------------|--------------------------------|-------------|
| `paginate_path`     | `site.paginate_path`           | Defines the pagination URL pattern (e.g., `"/blog/page/:num"`). |
| `previous_page_path` | `paginator.previous_page_path` | The URL for the previous page in the pagination sequence. |
| `next_page_path`     | `paginator.next_page_path`     | The URL for the next page in the pagination sequence. |

This allows it to work with [`jekyll-category-pages`](../plugins/category-pages.md)

### Example Usage with Parameters

{% raw %}
```liquid
{% include paginator_nav.html paginate_path="/blog/page/:num" previous_page_path=paginator.previous_page_path next_page_path=paginator.next_page_path %}
```
{% endraw %}

## Example Output

When used in a paginated blog, the output might look like this:

```html
<div class="paginate-container">
    <div role="navigation" aria-label="Pagination" class="d-flex d-md-inline-block pagination">
        <a class="previous_page" rel="prev" href="/blog/page/2/" aria-disabled="false">Previous</a>
        <a href="/blog/" aria-label="1">1</a>
        <a href="/blog/page/2/" aria-label="2">2</a>
        <a href="/blog/page/3/" aria-label="3">3</a>
        <a class="next_page" rel="next" href="/blog/page/2/" aria-disabled="false">Next</a>
    </div>
</div>
```

## Notes

- The `paginator.total_pages` check ensures pagination is only displayed when necessary.
- The first page always links to the base URL instead of `/page/1/` for cleaner URLs.
- This include is meant to be used in layouts that support pagination (`jekyll-paginate` or `jekyll-paginate-v2`).
