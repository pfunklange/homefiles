db() {
  group="$1"
  shift
  mysql "--defaults-group-suffix=_$group" "$@"
}

db-dump() {
  group="$1"
  shift
  mysqldump "--defaults-group-suffix=_$group" "$@"
}
