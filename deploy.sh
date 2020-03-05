#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

git init
git config user.name "i@arn0.org"
git config user.email "i@arn0.org"

git remote add upstream "git@github.com:arn0blog/arn0page.git"
git fetch upstream
git reset upstream/master

echo "arn0.org" > CNAME

# Push To Github
#git add *
#git commit -m "update"
#git push origin master -f

# Push To Coding
git remote set-url origin https://CO_TOKEN@e.coding.net/arn0/MainPage.git
git add *
git commit -m "update"
git push origin master -f
