#!/bin/bash
set -e

if [[ -n "${JEKYLL_FOLDER}" ]]; then
    # If JEKYLL_FOLDER is set, use it as the source folder
    JEKYLL_OPTIONS+="-s ${JEKYLL_FOLDER}"
fi

bundle exec jekyll serve $JEKYLL_OPTIONS --livereload
