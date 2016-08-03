autoload -Uz vcs_info
PROMPT='[%n@%m]# '
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

autoload -U compinit; compinit
zstyle ':completion:*:default' menu select=1
setopt auto_cd
alias sudo='sudo '
alias ...='cd ../..'
alias ....='cd ../../../'

if [ -x "`which nvim`" ]; then
    alias vi=nvim
    alias vim=nvim
fi 


