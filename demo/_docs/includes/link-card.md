---
title: Link Card
category: includes
order: 41
---

This include file generates a card for displaying a link with optional thumbnail and description. It's designed to be flexible and can display as either a clickable link or a text-only card.

## Usage

To use this include in your Jekyll theme, add the following line to your template:

{% raw %}
```liquid
{% include link-card.html link=page.link_object %}
```
{% endraw %}

## Parameters

You can customize the behavior of this include by passing a `link` object with the following properties:

| Property | Required | Description |
|----------|----------|-------------|
| `name` | Yes | The name or title of the link |
| `url` | No | The URL for the link. If not provided, the card will be displayed as text-only |
| `thumbnail` | No | The path to an image to be used as a thumbnail |
| `description` | No | A brief description of the link |
| `octicon` | No | An Octicon name to display instead of a thumbnail |

Example with parameters:

{% raw %}
```liquid
{% assign link = page.featured_link %}
{% include link-card.html link=link %}
```
{% endraw %}

## Functionality

1. The include checks if a URL is provided for the link.
2. If a URL is present:
   - It creates a clickable card with hover effects.
   - Displays a thumbnail image or Octicon if provided.
   - Shows the link name and description (if available).
3. If no URL is present:
   - It creates a non-clickable text card.
   - Displays a thumbnail image if provided.
   - Shows the link name and description (if available).

## Dependencies

This include file may depend on:

1. Octicons: The GitHub icon set, used if an `octicon` property is specified.

## Notes

- The include uses Liquid tags and filters, such as `relative_url`, to ensure correct URL generation.
- The `octicon` functionality assumes you have the Octicons library or a similar icon system set up in your theme.
- The include uses responsive design principles with flexbox for layout.
