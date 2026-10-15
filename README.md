# Florilège — Hugo theme

A clean [Hugo](https://gohugo.io) theme for collections of quotes and short
thoughts: colored category badges, "bubble" layout, legend, keywords.
Originally derived from the `base` theme of
[Quinoa](https://github.com/blankoworld/quinoa), a static blog engine written
in Lua — Florilège carries over its look and brings it to Hugo.

## Installation

In an existing Hugo site:

```sh
git submodule add https://github.com/blankoworld/hugo-florilege themes/florilege
```

Then in `hugo.toml`:

```toml
theme = "florilege"
```

## Trying out the theme

A demo site is provided in `exampleSite/`, with real quotes from the
original blog:

```sh
cd exampleSite
hugo server
```

## Expected front matter for a quote

```yaml
---
title: "81"
date: 2015-12-23
categories: ["perso"]
tags: ["bleak", "irony", "proverb"]
author: "olivier"
---

The secret to happiness is to leave it to others.
```

- `categories`: a single value, used for the colored badge (see
  `data/categories.yaml` below).
- `tags`: keywords, native Hugo taxonomy.
- `author`: optional, otherwise falls back to the site's `params.author`.

Quotes are meant to be numbered sequentially (`1.md`, `2.md`, …), the
filename being the identifier shown as `#N` and used as the permalink
anchor. From your site's root directory, run:

```sh
./themes/florilege/scripts/new_post.sh
```

This finds the highest existing numeric filename in `content/posts/`,
and creates `<N+1>.md` with `hugo new`. The theme's archetype
(`archetypes/posts.md`) then pre-fills `title` to match, and leaves example
`categories`/`tags` values as comments to help you fill the front matter.

You can still run `hugo new content posts/<N>.md` by hand if you'd rather
pick the number yourself — the archetype will compute the same suggested
`title`, but won't rename the file for you if it doesn't match.

## Defining categories and their colors

`data/categories.yaml` is **required** at the root of the site (not the
theme) as soon as any content uses `categories` in its front matter. For each
category slug used in your content, it must define a `label` (shown in the
sidebar legend) and a `color` (CSS color, used for the badge):

```yaml
perso:
  label: Personal
  color: "#E68B0A"
normal:
  label: Normal
  color: "#000000"
```

A category used in content but missing from this file will still display
(with a humanized label and a black badge fallback), but won't be properly
labeled or colored — so keep this file in sync with the categories you
actually use.

## Site parameters (`hugo.toml`)

```toml
[params]
  subtitle = "subtitle shown under the title"
  author = "default author for quotes"
  introduction = "text shown between the header and the content"
  sidebar = "free text shown in the sidebar, above the legend"
  footer = "free text shown in the footer"
  favicon = "favicon.ico"
```

The number of quotes shown per page (home, posts list, tag/category pages)
is controlled by Hugo's own pagination setting, not a theme parameter:

```toml
[pagination]
  pagerSize = 10
```

Below that number, no pagination links are shown at all. Above it, an
"Older" / "Newer" pair of links appears where relevant (only "Older" on the
first page, only "Newer" on the last page, both in between).

## Translations

Interface strings (navigation, "keywords", "powered by"…) live in
`i18n/*.toml`. To add a language, copy `i18n/fr.toml` to
`i18n/<code>.toml` and translate it.

## Origin

This theme comes from a personal migration: see
[Quinoa](https://github.com/blankoworld/quinoa) for the original Lua blog
engine, whose `template/base/` served as the visual basis for Florilège.

The default favicon (`static/favicon.ico`) is the "hash" icon from
[Feather Icons](https://feathericons.com) (MIT license).

## License

MIT. See `LICENSE`.
