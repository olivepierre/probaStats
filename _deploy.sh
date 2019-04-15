#!/bin/sh

set -e

[ -z "${TRAVIS_CI_TOKEN}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "olivepierre@gmail.com"
git config --global user.name "Pierre Olive"

git clone --single-branch --branch master https://${TRAVIS_CI_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../docs/* ./
git add .
git commit -m "Reconstruction du livre" || true
git push origin gh-pages
