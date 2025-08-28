
function git-clutter {
  git branch --merged | egrep -v '(^[*])|(staging|main)'
}

function git-clean-branches {
  for branch in `git-clutter`; do
    git branch -d $branch && git push origin :$branch
  done
}
