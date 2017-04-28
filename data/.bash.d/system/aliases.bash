alias ls='ls -GFh'
alias ll='ls -al'
alias s3='s3cmd --config ~/.s3cfg-mine'
alias unfuck-cameras='sudo killall VDCAssistant'

# docker
alias dps="docker ps -a --no-trunc"
alias kd="docker ps | awk '{print \$1}' | grep -v CON | xargs docker stop"

