---
title: Post Timeline
category: includes
order: 42
---

This include file generates a timeline of posts with an optional "View all" link at the end. It's designed to be flexible and customizable through various parameters.

## Usage

To use this include in your Jekyll theme, add the following line to your template:

{% raw %}
```liquid
{% include post-timeline.html %}
```
{% endraw %}

## Parameters

You can customize the behavior of this include by passing the following parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `collection` | `site.posts` | The collection of posts to display |
| `index` | None | The URL for the "View all" link |
| `limit` | `site.pagination` or `-1` | Number of posts to display |

Example with parameters:

{% raw %}
```liquid
{% include post-timeline.html collection=site.articles limit=5 index="/articles/" %}
```
{% endraw %}

If the limit is set to a number below 0, all posts will show.

### Demo Page

To see `post-timeline.html` in action within the `paginate_timeline` layout, visit our demo page:

[Post Timeline Demo](../../timeline.md){:.btn}

## Functionality

1. The include sets up initial variables based on the provided parameters or default values.
2. It sorts the collection by date in reverse order (newest first).
3. It creates a container for the timeline posts.
4. It iterates through the specified collection (limited by `limit` if set) and includes a `post-timeline-card.html` for each post.
5. If there are more posts in the collection than the displayed limit, it adds a "View all" link at the bottom.

## Dependencies

This include file depends on:

1. `post-timeline-card.html`: Another include file that should define how each post card is displayed.
2. Octicons: The GitHub icon set, used for the chevron-right icon in the "View all" link.

## Customization

To customize the appearance of the timeline:

1. Modify the CSS classes in this file to change the layout and spacing.
2. Edit the `post-timeline-card.html` include to change how individual posts are displayed.
3. Adjust the "View all" link text and styling as needed.

## Notes

- The `collection` parameter defaults to `site.posts` if not specified.
- The `limit` parameter is optional. If not set, all posts in the collection will be displayed.
- The `index` parameter is required for the "View all" link to function properly.
- The `relative_url` filter is used for the "View all" link, which is a Jekyll filter for generating correct URLs in different site configurations.
- The layout uses responsive design classes (`container-xl`, `p-responsive-blog`, etc.) for optimal display on various screen sizes.
