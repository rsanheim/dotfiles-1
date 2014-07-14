# Generate an ssh command through the GitHub bastion host.
#
# The first argument is a required command to execute on the remote machine.
# This is interpolated directly, so "" is a valid command if you just want a
# shell.
#
# The second argument, if specified, and if it matches the short or long form of
# one of the staff machines, will use that host instead of the default.
#
# Additional args are passed directly to the ssh command to be executed on the
# remote system, whichever that may be.
#
# output of /staff-hosts:
# lab                 -> staff1.rs.github.com
# garage              -> github-staff2-cp1-prd.iad.github.net
# machine-room        -> github-staff4-cp1-prd.iad.github.net
# spider-skull-island -> github-staff3-cp1-prd.iad.github.net
# aux2                -> ops-aux2-cp1-prd.iad.github.net
#
# aux1, for reference: aux1-ext.rs.github.com
function _gh-ssh() {
  local command=$1; shift
  local host=ops-aux2-cp1-prd.iad.github.net

  case "$1" in
    b|bastion)
      host=bastion
      shift
      ;;
    l|lab)
      host=staff1.rs.github.com
      shift
      ;;
    g|garage)
      host=github-staff2-cp1-prd.iad.github.net
      shift
      ;;
    mr|machine-room)
      host=github-staff4-cp1-prd.iad.github.net
      shift
      ;;
    ss|ssi|spider-skull-island)
      host=github-staff3-cp1-prd.iad.github.net
      shift
      ;;
    aux2|prod)
      host=ops-aux2-cp1-prd.iad.github.net
      shift
      ;;
  esac
  if [ "$host" = 'bastion' ]; then
    ssh -t remote.github.net $command $@
  else
    ssh -t remote.github.net ssh -t $host $command $@
  fi
}
# Bash completion function for gh-ssh commands
function _gh_ssh_c() {
  hosts="lab garage machine-room spider-skull-island aux2 prod bastion"
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$hosts" -- $cur) )
}
