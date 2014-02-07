#! /bin/bash

function cdfind {
  for dir in $(find . -name $1 -type d); do
    cd $dir; break
  done
}

function hurl { curl -LD - -o /dev/null $@; }
function rurl { curl -sL -w "%{http_code} %{url_effective}\\n" -o /dev/null $@; }

function git-clean-branches {
  branches=`git branch --merged | grep -v '^[*]' | grep '^  pat-'`
  for branch in $branches; do
    git branch -d $branch && git push origin :$branch
  done
}

function random-string {
  count=128
  class='[:print:]'
  [ $1 ] && [ $1 -gt 0 ] && count=$1
  [ $2 ] && class=$2
  head -c $count /dev/urandom | tr -cd $class
}
