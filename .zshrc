# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="i"

# Enable ssh autocomplete for mosh
#export compdef mosh=ssh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Node version manager
export NVM_DIR="/Users/ianlozinski/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=vim
export PATH="/$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin"

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ianlozinski/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Go
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Code/go
export PATH="$PATH:$GOPATH/bin"

# Postgres
export PATH=/usr/local/opt/postgresql/bin:$PATH
export PGHOST="/var/pgsql_socket"

# Aliases
alias mvi="mvim"
alias ber="bundle exec rake"
alias berc="be rails c"
alias bers="be rails s"
alias bu="berks install && berks upload --no-freeze --force"
alias md="open 'http://localhost:5000' && grip"
alias rti="RAILS_ENV=test ruby -Itest test"
alias be="bundle exec"
alias ag="ag --ignore=tags --pager less"
alias vds="$EDITOR \$(git status | grep modified | awk '{ print \$2 }')"
alias sl="ls"
alias gi="git"
alias gti="git"
alias gdf="git df"
alias gds="git dc"
alias gpr="git pull --rebase && git push"
alias co="git co"
alias git push="git pull && git rebase && git push"
alias ga="git add"
alias gs="git st"
alias gc='echo "Files changed since last deploy:" && git show --pretty="format:" --name-only $(git tag | grep production_app | tail -1)...master | egrep "^.+$" | sort | uniq'
alias gh="git show"
alias jsc="node"
alias ss="source ~/.zshrc"
alias pretty="python -m json.tool"

alias dev3="mosh ian@104.131.4.235"

eval "$(chef shell-init zsh)"
