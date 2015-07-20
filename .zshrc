PROMPT='[%n@%m]# '


RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
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
alias ...='cd ../..'
alias ....='cd ../../../'
# specific os settings
case "${OSTYPE}" in
    darwin*)
        alias ls='gls --color=auto'
        eval $(gdircolors ~/.dircolors-solarized)
        ;;
    linux*)
        #ls colors (http://news.mynavi.jp/column/zsh/009/)
        export LSCOLORS=xxfxcxdxbxegedabagacad
        alias ls="ls -G"
esac


