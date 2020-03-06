#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

git init
git config user.name "arn0blog"
git config user.email "i@arn0.org"

#git remote add upstream "git@github.com:arn0blog/arn0page.git"
#git fetch upstream
#git reset upstream/master

git checkout master
echo "arn0.org" > CNAME
wget https://raw.githubusercontent.com/arn0blog/arn0page/test/dist/index.html?token=AOR53YB4JQPMRCH52RLLIIS6MILXC
mv index.html* index.html
git add index.html CNAME
git commit -m "update'
git push origin master


# Push To Coding
git remote set-url origin https://CO_TOKEN@e.coding.net/arn0/MainPage.git
git add *
git commit -m "update"
git push origin master -f
