# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'
alias day='date +%Y-%m-%d'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='$EDITOR $yadr/cli/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/cli/zsh/aliases.zsh'  #alias reload

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias hpr='gpsh > /dev/null && hub pull-request && hub browse'
alias grb='git recent-branches'
alias groot='cd $(git root)'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias gz='tar -zcvf'
alias ka9='killall -9'
alias k9='kill -9'
alias ..='cd ..'

# Ruby
alias sr='spring rspec'
alias src='spring rails console'
alias be='bundle exec'

alias srake='spring rake'

# Python
alias pyclean='find . -name "*.pyc" -print0 | xargs -0 rm'

# Packages
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'
alias aptu='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove'

# Random
alias wisdom='fortune -s | cowsay'

# Remove binding.pry
alias depry="ag -l 'binding.pry' | xargs sed --in-place '/binding.pry/d'"

# Edit config
alias yedit='vim $HOME/.yadr/'

# Generate password
alias genpw='openssl rand -base64 18'

alias yadr='cd ~/.yadr'
alias x='startx'

alias c='ccat'

alias v='/usr/bin/nvim'
alias tailstaging='ssh deploy@staging.adhawk-api.com -C "tail -f ~/adhawk/shared/log/staging.log"'
alias taildashboard='ssh dashboard -C "tail -f /var/log/nginx/error.log"'
alias mailinglist='ssh ah-mailing-list -C "cat /tmp/mailing_list.yml"'
