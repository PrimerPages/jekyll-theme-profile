---
title: "Using with a GitHub action"
order: 100
category: Advanced
image: "https://raw.githubusercontent.com/PrimerPages/jekyll-theme-profile/main/screenshot.png"
---

You can also use this with GitHub actions. Below is a typical workflow file

```yaml
# Sample workflow for building and deploying a Jekyll site to GitHub Pages
name: Docs

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Run on every pull request
  pull_request:
    types: [opened, reopened, synchronize ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

  schedule:
    # This will refresh your repositories and other user information every day
    # * is a special character in YAML so you have to quote this string
    # Generate from https://crontab.guru/
    #        ┌───────────── minute (0 - 59)
    #        │ ┌───────────── hour (0 - 23)
    #        │ │ ┌───────────── day of the month (1 - 31)
    #        │ │ │ ┌───────────── month (1 - 12 or JAN-DEC)
    #        │ │ │ │ ┌───────────── day of the week (0 - 6 or SUN-SAT)
    #        │ │ │ │ │
    #        │ │ │ │ │
    #        │ │ │ │ │
    #        * * * * *
    - cron: "0 0 * * *"

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read # needed to read your repository
  pages: write # needed to enable and deploy github pages
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1.152.0
        with:
          bundler-cache: true # runs 'bundle install' and caches installed gems automatically
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v3
        with:
          enablement: true # Enable github pages if it's not
      - name: Build
        run: bundle exec jekyll build
        env:
          JEKYLL_ENV: production
          JEKYLL_GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  # Deployment job
  deploy:
    if: github.ref == 'refs/heads/main' # Only deploy from the main branch
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4

```
