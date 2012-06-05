
alias cdup="while [ ! -f index.php ]; do cd ..; done"
alias uusers="users | grep -o '\w\+' | uniq"
alias watchdog="tail -f /tmp/watchdog.log"
alias ll="ls -l"
alias la="ls -a"

# BSD/GNU command differences
case `uname` in
Darwin)
  alias ls="ls -G"
  ;;
*)
  alias ls="ls --color=auto"
  ;;
esac

alias cake="[ -f ./cake/console/cake ] && ./cake/console/cake"
