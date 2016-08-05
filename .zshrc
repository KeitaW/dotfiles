source ~/dotfiles/.zshenv
# enable coloring
umask 002
autoload -Uz colors
colors
# Prompt
PROMPT='[%F{magenta}%B%n%b%f@%F{blue}%U%m%u%f]# '
RPROMPT='[%F{green}%d%f]'
# enable input completion
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
# make completion functionality case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd
alias sudo='sudo '
alias ...='cd ../..'
alias ....='cd ../../../'

if [ -x "`which nvim`" ]; then
    alias vi=nvim
    alias vim=nvim
fi 

alias python2=$PYENV_ROOT/versions/anaconda2-4.0.0/bin/python2.7
alias python3=$PYENV_ROOT/versions/anaconda3-4.0.0/bin/python3.5
alias ctags=/usr/local/Cellar/ctags/5.8_1/bin/ctags
# monogusa aliases
alias cD='cd ~/dotfiles'
# monogusa temporary aliases
alias cY='cd ~/Projects/YACuSA'
alias cYB='cd ~/Projects/YACuSA/bin'
alias cYR='cd ~/Projects/YACuSA/results'
alias cYL='cd ~/Projects/YACuSA/lib'
alias cYLU='cd ~/Projects/YACuSA/lib/utils'
alias cYn='cd ~/Projects/YACuSA/notes'
alias cA='cd ~/Dropbox/labResearch/2016_03_article/'

