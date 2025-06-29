---
title: Post Timeline Card
category: includes
order: 42
---

The **Post Timeline Card** include file is responsible for rendering individual posts within a timeline layout. It provides a structured and customizable way to display posts with metadata such as title, author, date, tags, and optional media (images or videos).

## Usage

To use this include in your Jekyll theme, add the following line within a template:

{% raw %}
```liquid
{% include post-timeline-card.html post=post %}
```
{% endraw %}

## Parameters

This include requires a `post` object to be passed, which contains various metadata fields. Below is a list of supported fields:

| Parameter  | Required | Default | Description |
|------------|----------|---------|-------------|
| `post.url` | ✅ Yes  | N/A     | The permalink to the post |
| `post.title` | ✅ Yes | N/A     | The title of the post |
| `post.author` | ❌ No  | None    | The author of the post |
| `post.date` | ✅ Yes | N/A     | The date the post was published |
| `post.tags` | ❌ No  | None    | An array of tags associated with the post |
| `post.excerpt` | ❌ No  | None    | A short excerpt from the post |
| `post.content` | ❌ No  | None    | The full content of the post (used for "Continue Reading") |
| `post.type` | ❌ No  | `comment` | The type of post, used for the Octicon badge |
| `post.video` | ❌ No  | None    | A URL to an embedded video |
| `post.image` | ❌ No  | None    | A URL to a featured image |

### Demo Page

To see `post-timeline-card.html` in action within the `post-timeline` include, visit our demo page:

[Timeline Demo](../../timeline.md){:.btn}

## Dependencies

This include relies on:

1. **Octicons**: The GitHub icon set for the badge next to the title.
2. **CSS Styles**: The `.TimelineItem` and `.IssueLabel` classes should be styled appropriately in your theme.
3. **Jekyll Collections**: The include expects a post-like object, typically from `site.posts`.

## Customization

To modify how posts are displayed:

1. **Edit the CSS**: Adjust the `.TimelineItem`, `.title`, and `.summary` styles.
2. **Modify the HTML**: Change the markup within `post-timeline-card.html` to match your theme.
3. **Update the Octicons**: Modify the `post.type` value to change the icon displayed.

## Notes

- Ensure that the `post` object is correctly passed when including this file.
- If `post.type` is not provided, it defaults to `comment` for the Octicon.
- The layout is designed to be responsive and adaptable to different screen sizes.
- The `relative_url` filter is used for post links to ensure compatibility with different site configurations.
