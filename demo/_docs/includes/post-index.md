---
title: Post Index
category: includes
order: 40
---

## Purpose
The `post-index.html` include file creates a straightforward, list-style layout for displaying collections of posts. It's designed to present posts in a uniform, easy-to-scan format, ideal for archives, category listings, or any situation where a clean, consistent display is desired.

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `collection` | Required | The collection of posts to display |
| `collection_permalink` | `:name` | The permalink structure for individual collection pages |
| `replace_value` | `:name` | The value to replace in the `collection_permalink` with the section slug |
| `per_section` | 6 | Number of posts to display per section |

## Usage

To use this include in your Jekyll site, you can call it from a layout or another include file like this:

{% raw %}
```liquid
{% include post-index.html
    collection=site.categories
    collection_permalink='/category/:name/'
    replace_value=':name'
    per_section=8
%}
```
{% endraw %}

### Layout

The `tag_index` layout utilizes `post-index.html` to create a page that showcases posts with various tags.

To use the `tag_index` layout in a page:

```yaml
---
layout: tag_index
title: Tags
---
```

### Demo Page

To see `post-index.html` in action within the `tag_index` layout, visit our demo page:

[Tag Index Demo](../..//tags/index.html){:.btn}

## Functionality

1. **Section Display**: For each section in the collection:
   - Displays a heading with the section name.
   - Shows a "View all" link if there are more posts than the `per_section` limit.

2. **Post Layout**:
   - All posts within a section are displayed using `post-card.html`.
   - Posts are arranged in a flex-wrap layout, allowing for responsive design.

3. **Responsive Design**:
   - Uses Bootstrap classes for responsive layout.
   - The "View all" link is hidden on smaller screens and displayed on larger screens.

## Dependencies

This include depends on:
- `post-card.html`
- PRimer CSS classes
- Octicons for the "View all" arrow

## Customization

You can customize the appearance by modifying the HTML structure and CSS classes within the include file. The layout uses Primer css flex and grid classes, which can be adjusted to fit different design requirements.

## Notes

- Ensure that the `post-card.html` include is properly set up in your Jekyll site.
- The "View all" link uses the `collection_permalink` and `replace_value` to generate the correct URL for each section.
