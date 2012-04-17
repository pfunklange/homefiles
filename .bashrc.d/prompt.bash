#! /bin/bash
if [ $(type -t __git_ps1) == 'function' ]; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="$(txt bldblk '[\t]')$(txt txtgrn '[\u')$(txt txtcyn '@')$(txt txtgrn '\h')$(txt txtcyn ':')$(txt txtgrn '\W$(__git_ps1 "(%s)")]')\\$ "
fi

case $TERM in
xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}[`basename ${PWD}`]\007"'
  ;;
screen*)
  PROMPT_COMMAND='echo -ne "\033k[`basename ${PWD}`]\033\\"'
  ;;
*)
  ;;
esac
