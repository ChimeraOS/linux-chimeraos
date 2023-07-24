#!/bin/bash

. linux/PKGBUILD

tagname="v${pkgver%.*}-${pkgver##*.}-${pkgrel}"
echo "Making git tag for $tagname"
git tag "${tagname}" && git log -1
