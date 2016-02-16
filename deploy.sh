#!/bin/sh

git log --max-count=1 --format=format:%an | xargs -0 -n 1 git config --global -- user.name &&
git log --max-count=1 --format=format:%ae | xargs -0 -n 1 git config --global -- user.email &&

git config --global push.default simple &&

git branch --force "$TRAVIS_BRANCH" &&
git checkout "$TRAVIS_BRANCH" &&
git config remote.origin.url git@github.com:"$TRAVIS_REPO_SLUG".git &&

eval "$(ssh-agent -s)" &&
chmod 600 ./secret/id_rsa &&
ssh-add ./secret/id_rsa &&

rm -rf $HOME/.sbt/ghpages
sbt "; ++$TRAVIS_SCALA_VERSION; set scalaJSStage in js := FullOptStage; ghpagesPushSite"

