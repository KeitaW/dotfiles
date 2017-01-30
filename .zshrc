source ~/dotfiles/.zshenv
# enable coloring
umask 002
autoload -Uz colors
colors
# Prompt
PROMPT='[%F{magenta}%B%n%b%f@%F{blue}%U%m%u%f]# '
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
 psvar=()
 LANG=en_US.UTF-8 vcs_info
 [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)[%F{green}%d%f]"
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
# Logs will be saved in .zsh_history
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_space
