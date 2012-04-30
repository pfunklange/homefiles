#! /bin/bash
tcolor="bldred";
[ -f /etc/redhat-release ] && tcolor="bldpur";
uname -v | grep -q Ubuntu && tcolor="bldblk";
uname | grep -q Darwin && tcolor="bldblu";

if [ $(type -t __git_ps1) == 'function' ]; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="$(txt $tcolor '[\t]')$(txt txtgrn '[\u')$(txt txtcyn '@')$(txt txtgrn '\h')$(txt txtcyn ':')$(txt txtgrn '\W$(__git_ps1 "(%s)")]')\\$ "
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
