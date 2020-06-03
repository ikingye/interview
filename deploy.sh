#!/bin/sh

set -x
printf "\033[0;32m Programmer-Interview-Checklist Deploying updates to GitHub...\033[0m\n"
cd $(dirname "$0")

# Commit changes.
msg="rebuilding site $(date)"

# update the theme
git submodule update --remote
# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To docs folder
cd docs
# Add changes to git.
git add .
git commit -m "$msg"
# Push to blog repo and trigger building blog.
git push origin master

# push to source repo
cd ..
git add .
git commit -m "$msg"
git push origin master
