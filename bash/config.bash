fpath=($BASH/functions $fpath)

autoload -U $BASH/functions/*(:t)

HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
