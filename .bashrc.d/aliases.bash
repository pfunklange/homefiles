
alias cdup="while [ ! -f index.php ]; do cd ..; done"
alias uusers="users | grep -o '\w\+' | uniq"
alias watchdog="tail -f /tmp/watchdog.log"

# BSD/GNU command differences
case `uname` in
Darwin)
  alias ls="ls -G"
  ;;
*)
  alias ls="ls --color=auto"
  ;;
esac
