#!/bin/bash

PKGBUILD_FILE="linux/PKGBUILD"
if [ -f "$PKGBUILD_FILE" ]; then
  . "$PKGBUILD_FILE"
else
  echo "$PKGBUILD_FILE not found. Are we in the root of the git project?"
  exit 1
fi

tagname="v${pkgver%.*}-${pkgver##*.}-${pkgrel}"
if out=$(git status --porcelain) && [ -z "$out" ]; then
  echo "Making git tag for $tagname"
  git tag "${tagname}" && git log -1
else
  echo "Working directory is not clean"
  git status
fi
