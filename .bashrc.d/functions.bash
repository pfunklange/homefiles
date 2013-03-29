#! /bin/bash

function cdfind {
  for dir in $(find . -name $1 -type d); do
    cd $dir; break
  done
}

function hurl { curl -LD - -o /dev/null $@; }

function git-clean-branches {
  branches=`git branch --merged | grep -v '^[*]'`
  for branch in $branches; do
    git branch -d $branch && git push origin :$branch
  done
}
