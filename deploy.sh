#!/bin/sh

set -x
printf "\033[0;32m interview Deploying updates to GitHub...\033[0m\n"
cd $(dirname "$0")

# Commit changes.
msg="rebuilding site $(date)"

# update the theme
git submodule update --remote
# Build the project.
hugo

# push to source repo
git add .
git commit -m "$msg"
git push origin master
