

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
which hub 2>/dev/null | grep hub >/dev/null && alias git='hub'

# git-related aliases
alias g='git grep'
alias gk='script/gack'
alias gf='git fetch'
alias gm='git checkout master'
alias gro='git stash && git checkout master && git reset --hard origin/master'
alias gr='git stash && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
alias pickaxe='git log -p -S'
alias gpu='git push origin master'
alias gpl='git pull origin master'
alias gd='git diff'
alias gb='git branch'
alias gdc='git diff --cached'
alias gst='git status'
alias gl='git log'
alias gc='git commit'
alias gqc='git whatchanged -p'
alias am='git commit --amend'
alias gv='git commit -v'
alias gav='git commit -a -v'
alias ga='git add'
alias gs='git status'
alias glg='git log --graph --oneline'
alias glgr='git log --graph'
alias pick='git cherry-pick'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gsb='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gt='git-track'
alias commit='git-open-commit'
alias ow='git overwritten'
