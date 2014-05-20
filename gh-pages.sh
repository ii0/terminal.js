#! /bin/sh -x
#
# gh-pages.sh
# Copyright (C) 2014 Enno Boland <eb@s01.de>
#
# Distributed under terms of the MIT license.
#

cd "`which $0 | xargs dirname`" || exit $?
rev=`git rev-parse HEAD`

grunt clean || exit $?
git clone -b gh-pages . doc || exit $?
grunt doc || exit $?
git -C doc commit -am "rebuild docs based on $rev" || exit $?
git -C doc push $PWD gh-pages || exit $?
grunt clean || exit $?
