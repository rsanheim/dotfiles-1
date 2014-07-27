# Load up The GitHub Setup's environment.

if [ -f "/opt/boxen/env.sh" ]
  then source "/opt/boxen/env.sh"
fi

export PATH="$HOME/bin:./bin:/usr/local/bin:/usr/local/sbin:$BASH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
