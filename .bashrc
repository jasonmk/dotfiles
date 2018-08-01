# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
      . /etc/bashrc
fi

source ~/.dotfiles/ps1.sh

alias vi=vim
alias be='bundle exec'

umask 0022

if [ -f /opt/rh/python27/enable ]; then 
  source /opt/rh/python27/enable
fi

PATH=~/bin:~/.local/bin:$PATH
export PATH
export AWS_DEFAULT_REGION=us-east-1
