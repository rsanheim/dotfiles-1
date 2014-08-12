alias gh='cd ~/github/github'

# TODO - let's clean these up to use the bastion host / gh-ssh properly
alias  garage='ssh -t -v github-staff2-cp1-prd.iad.github.net'
alias  spider='ssh -t -v github-staff3-cp1-prd.iad.github.net'
alias machine='ssh -t -v github-staff3-cp1-prd.iad.github.net'
alias   janky='gh-ssh -t -v janky-fe2-cp1-prd.iad.github.net'

alias gh-ssh='_gh-ssh ""'
alias gh-console='_gh-ssh gh-console'
alias gh-dbconsole='_gh-ssh gh-dbconsole bastion'
alias gh-hosts='_gh-ssh gh-hosts bastion'

# and for those who need it:
alias gh-repo='_gh-ssh gh-repo bastion'
