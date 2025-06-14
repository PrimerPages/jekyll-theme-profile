---
title: Post Gallery
category: includes
order: 42
---

The `post-gallery.html` include file creates a magazine-style layout for displaying collections of posts. It's designed to showcase posts in a visually appealing manner, with the first post of each section displayed prominently and subsequent posts in a more compact format.

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `collection` | Required | The collection of posts to display |
| `collection_permalink` | `:name` | The permalink structure for individual collection pages |
| `replace_value` | `:name` | The value to replace in the `collection_permalink` with the section slug |
| `per_section` | 3 | Number of posts to display per section |

## Usage

To use this include in your Jekyll site, you can call it from a layout or another include file like this:

{% raw %}
```liquid
{% include post-gallery.html
    collection=site.categories
    collection_permalink='/category/:name/'
    replace_value=':name'
    per_section=4
%}
```
{% endraw %}

### Layout

The `category_index` layout utilizes `post-gallery.html` to create a page that showcases posts from various categories.

To use the `category_index` layout in a page:

```yaml
---
layout: category_index
title: Explore Our Categories
---
```

### Demo Page

To see `post-gallery.html` in action within the `category_index` layout, visit our demo page:

[Category Index Demo](../../category/index.html){:.btn}

## Functionality

1. **Section Display**: For each section in the collection:
   - Displays a heading with the section name.
   - Shows a "View all" link if there are more posts than the `per_section` limit.

2. **Post Layout**:
   - The first post in each section is displayed using `post-tease-image-card.html`.
   - Subsequent posts use `post-tease-text-card.html`.
   - Alternates the layout direction between sections for visual variety.

3. **Responsive Design**:
   - Uses Primer classes for responsive layout.
   - Adjusts layout based on the number of posts in the section.

## Dependencies

This include depends on:
- `post-tease-image-card.html`
- `post-tease-text-card.html`
- Primer CSS classes
- Octicons for the "View all" arrow

## Customization

You can customize the appearance by modifying the HTML structure and CSS classes within the include file. The layout uses Bootstrap grid classes, which can be adjusted to fit different design requirements.

## Notes

- Ensure that the `post-tease-image-card.html` and `post-tease-text-card.html` includes are properly set up in your Jekyll site.
- The `{% raw %}{% cycle '', 'flex-row-reverse' %}{% endraw %}` tag alternates the layout direction for visual interest.
- The "View all" link uses the `collection_permalink` and `replace_value` to generate the correct URL for each section.
