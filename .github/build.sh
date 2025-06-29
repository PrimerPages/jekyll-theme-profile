#!/bin/bash
set -e

if [[ -n "${JEKYLL_FOLDER}" ]]; then
    # If JEKYLL_FOLDER is set, use it as the source folder
    JEKYLL_OPTIONS+="-s ${JEKYLL_FOLDER}"
    BUNDLE_OPTIONS+="--gemfile ${JEKYLL_FOLDER}/Gemfile"
fi

bundle install $BUNDLE_OPTIONS
bundle exec jekyll build $JEKYLL_OPTIONS
