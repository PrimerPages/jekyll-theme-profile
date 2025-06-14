---
title: Links
category: includes
order: 41
---

This include file generates a collection of link cards, typically used for displaying a set of important links on a page.

## Usage

To use this include in your Jekyll theme, add the following line to your template:

{% raw %}
```liquid
{% include links.html %}
```
{% endraw %}

## Parameters

This include doesn't accept direct parameters. Instead, it relies on page or site-wide variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `page.links` | `site.links` | The collection of links to display |

## Functionality

1. The include looks for a `links` variable, first on the current page, then falling back to the site configuration.
2. It creates a container for the link cards.
3. It iterates through each link in the collection and includes a `link-card.html` for each one.

## Dependencies

This include file depends on:

1. `link-card.html`: Another include file that defines how each link card is displayed.

## Customization

To customize the appearance of the links collection:

1. Modify the CSS classes in this file to change the layout and spacing.
2. Edit the `link-card.html` include to change how individual links are displayed.
3. Adjust the container structure if you need a different layout for the links.

## Notes

- Ensure that you have defined a `links` collection either in your page front matter or in your site's configuration.
- The layout uses flexbox for responsive design, allowing the links to adapt to different screen sizes.
