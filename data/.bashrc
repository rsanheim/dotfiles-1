# shortcut to this dotfiles path is $BASH
export BASH=$HOME/.bash.d

# load path files first
for file in $(find $BASH -type f -name 'path.bash')
do
  source $file
done

# load everything but the path and completion files
others=`find $BASH -type f -name '*.bash' | grep -v -e completion.bash -e path.bash`

for file in $others
do
  source $file
done

# TODO: make sure something loads all functions

# load every completion after autocomplete loads
for file in $(find $BASH -type f -name 'completion.bash')
do
  source $file
done
