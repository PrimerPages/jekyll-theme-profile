---
title: "Appbar style"
order: 11
category: Styles
image: "../../media/appbar-preview.png"
---

![](../../media/appbar-preview.png)

The **appbar** style modifies the theme's header section to provide a clean, GitHub-like navigation experience.  It features

- A fixed top navigation bar
- Consistent spacing and typography matching GitHub's Primer style
- Dark and light mode compatibility

## Usage

You can use this style as a default for your website, or set the style of an individual page.

### Setting as the default style

Modify the `_config.yml` file to set `appbar` as the theme's default style

```yml
style: appbar
```

### Setting the style of a page

To apply the **appbar** style to a specific page, add the following front matter in your `.md` file

```md
---
style: appbar
---
```

## Example usage

See examples of an appbar as a [home](../../appbar.md), [page](../../page/appbar.md) and [post](../../_posts/2023-11-10-post-appbar.md)

![](../../media/appbar-tablet.png)
