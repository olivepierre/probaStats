#!/bin/sh

set -e

[ -z "${TRAVIS_CI_TOKEN}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "xie@yihui.name"
git config --global user.name "Yihui Xie"

git clone -b gh-pages https://${TRAVIS_CI_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
