#!/bin/bash

. linux/PKGBUILD

tagname="v${pkgver%.*}-${pkgver##*.}-${pkgrel}"
if out=$(git status --porcelain) && [ -z "$out" ]; then
  echo "Making git tag for $tagname"
  git tag "${tagname}" && git log -1
else
  echo "Working directory is not clean"
  git status
fi
