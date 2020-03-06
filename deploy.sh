#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

git init
git config user.name "arn0blog"
git config user.email "i@arn0.org"

git remote add upstream "git@github.com:arn0blog/arn0page.git"
git fetch upstream
git reset upstream/master

cp src/index.html /tmp
git checkout master
mv /tmp/index.html .
echo "arn0.org" > CNAME
git add index.html CNAME
git commit -m "update'
git push origin master


# Push To Coding
git remote set-url origin https://CO_TOKEN@e.coding.net/arn0/MainPage.git
git add *
git commit -m "update"
git push origin master -f
