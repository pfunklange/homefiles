#! /bin/bash

function cdfind {
  for dir in $(find . -name $1 -type d); do
    cd $dir; break
  done
}
