# Bash Profile - Jordan Appleson 2012

CURRENT= ${pwd##*/}
BASENAME=`$CURRENT`
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
BRANCH=`parse_git_branch`

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[0;38m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$WHITE[$WHITE\$(date +%H:%M)$WHITE]\
 $WHITE\u@\h:\W$WHITE $BLUE\$(parse_git_branch) $WHITE\
$WHITE\$ "
PS2='> '
PS4='+ '
}

proml




