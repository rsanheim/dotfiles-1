OS=`uname`
PROMPTOS='\[\033[1;31m\]@\[\033[m\]'

# get color codes specific for this user@host combination
MISC='yossefsucks'
ID=${MISC}`id -nu`
HOSTID=$ID@`hostname`
IDHASH=`echo ${ID} | ${MD5} | sed 's/^\(.\).*$/\1/'`
HOSTIDHASH=`echo ${HOSTID} | ${MD5} | sed 's/^\(.\).*$/\1/'`
IDCODE=`echo $IDHASH | perl -e '$char = <>; chomp($char); $char = hex($char); print "".(!$char ? 33 : ($char > 8 ? 32+$char : 30+$char))."\n"'`
HOSTIDCODE=`echo $HOSTIDHASH | perl -e '$char = <>; chomp($char); $char = hex($char); print "".(!$char ? 33 : ($char > 8 ? 32+$char : 30+$char))."\n"'`
# get yer prompt on!  (thanks brett (brett@shadowed.net) for original prompt)
PS1="${PROMPTOS} \\[\\033[1;${IDCODE}m\\]\\d \\t\\[\\033[m\\] \\[\\033[1;${HOSTIDCODE}m\\]\\u\\[\\033[0m\\]@\\[\\033[1;${HOSTIDCODE}m\\]\\h\\[\\033[0m\\]\\n${PROD}\\w\\[\\033[1;${IDCODE}m\\]\$(__git_ps1)\$(git_dirty)\\$\\[\\033[m\\] "

export PS1

# update terminal title
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'
export PROMPT_COMMAND

# TODO: get git info in my prompt again

#if [[ -n $SSH_CONNECTION ]]; then
#  export PS1='%m:%3~$(git_info_for_prompt)%# '
#else
#  export PS1='%3~$(git_info_for_prompt)%# '
#fi
