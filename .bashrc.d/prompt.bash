#! /bin/bash
if [ $(type -t __git_ps1) == 'function' ]; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="$(txt bldblk '[\t]')$(txt txtgrn '[\u')$(txt txtcyn '@')$(txt txtgrn '\h')$(txt txtcyn ':')$(txt txtgrn '\W$(__git_ps1 "(%s)")]')\\$ "
fi

case $TERM in
xterm*|rxvt*)
  PS1="\[\e]0;\u@\h: \W\a\]$PS1"
  ;;
screen*)
  PS1='\[\033k[\W]\033\\\]'"$PS1"
  ;;
*)
  ;;
esac
