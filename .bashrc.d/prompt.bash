#! /bin/bash

# Returns the current time with half hour accuracy as an emoji symbol
# Inspired by: http://notes.torrez.org/2013/04/put-a-burger-in-your-shell.html
function emoji_clock() {
    hour=$(date '+%I')
    minutes=$(date '+%M')
    case $hour in
      01) clock="🕐"; [ $minutes -ge 30 ] && clock="🕜";;
      02) clock="🕑"; [ $minutes -ge 30 ] && clock="🕝";;
      03) clock="🕒"; [ $minutes -ge 30 ] && clock="🕞";;
      04) clock="🕓"; [ $minutes -ge 30 ] && clock="🕟";;
      05) clock="🕔"; [ $minutes -ge 30 ] && clock="🕠";;
      06) clock="🕕"; [ $minutes -ge 30 ] && clock="🕡";;
      07) clock="🕖"; [ $minutes -ge 30 ] && clock="🕢";;
      08) clock="🕗"; [ $minutes -ge 30 ] && clock="🕣";;
      09) clock="🕘"; [ $minutes -ge 30 ] && clock="🕤";;
      10) clock="🕙"; [ $minutes -ge 30 ] && clock="🕥";;
      11) clock="🕚"; [ $minutes -ge 30 ] && clock="🕦";;
      12) clock="🕛"; [ $minutes -ge 30 ] && clock="🕧";;
      *) clock="⌛";;
    esac
    echo $clock
}

tcolor="bldred";
[ -f /etc/redhat-release ] && tcolor="bldpur";
uname -v | grep -q Ubuntu && tcolor="bldblk";
uname | grep -q Darwin && tcolor="bldblu";
case `uname -n` in
  reporting*)
    tcolor="bldred"
    ;;
  bacon*)
    tcolor="bldylw"
    ;;
  *)
    ;;
esac

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
