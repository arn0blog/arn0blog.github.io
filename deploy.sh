#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

git init
git config user.name "arn0blog"
git config user.email "arn0.maxlv@gmail.com"

git remote add upstream https://github.com/arn0blog/arn0page.git
git fetch upstream
git reset upstream/test

cp src/index.html /tmp
git checkout master
mv /tmp/index.html .
echo "arn0.org" > CNAME
git add index.html CNAME
git commit -m "update'
git push origin master
