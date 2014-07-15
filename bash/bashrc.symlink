# shortcut to this dotfiles path is $BASH
export BASH=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Code

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our bash files
# TODO: wtf
#typeset -U config_files
config_files=($BASH/**/*.bash)

# load the path files
for file in $(find $BASH -type f -name 'path.bash')
do
  source $file
done

others=`find $BASH -type f -name '*.bash' | grep -v -e completion.bash -e path.bash`

# load everything but the path and completion files
for file in $others
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
# TODO: is this needed in bash land?
# autoload -U compinit
# compinit

# load every completion after autocomplete loads
for file in $(find $BASH -type f -name 'completion.bash')
do
  source $file
done

unset config_files
