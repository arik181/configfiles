HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=vim
setopt appendhistory autocd extendedglob 
unsetopt beep nomatch notify
bindkey -v
bindkey -v '^r' history-incremental-search-backward
bindkey -v '^b' backward-word
bindkey -v '^k' kill-whole-line
bindkey -v '^e' end-of-line
stty erase '^H'

#MAIL and PATH are set in .zshlocal

# Edit
# Additional editing commands can be found as 
# shell scripts in ~/bin
alias :z='vi ~/.zshrc && source ~/.zshrc'
alias :b='vi ~/.bashrc && source ~/.bashrc'
alias :i='vi ~/.inputrc'
alias :v='vi ~/.vimrc'
alias :M='vi ./Makefile'
alias :zh='vi ~/.histfile' 

# cd/ls
alias ls='clear;ls --color=auto'
alias lsa='clear;ls -lAU --color=auto'
alias a='clear;cd ~;ls -la --color=auto'
alias s='clear;cd ~/code;ls -la --color=auto'
alias S='clear;cd ~/bin;ls -la --color=auto'
alias t='clear;cd ~/tmp;ls -la --color=auto'
alias code='clear;cd ~/code;ls -la --color=auto'


# ssh/hosts
# Hosts are set in .zshsensitive

# overrides
alias du='du -h'
alias df='df -h'
alias date='date +%H:%M:%S\ -\ %d\ %b\ %y'
alias scr='screen -raAd'
alias xr1='xrandr --output DVI-0 --mode 640x480'
alias xr2='xrandr --output DVI-0 --mode 1680x1050'

alias x='exit'

source ~/.zshsensitive
source ~/.zshlocal
