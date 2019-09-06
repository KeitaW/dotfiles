# Environment Variables
export XDG_CONFIG_HOME=~/.config
export CLICOLOR=1
export LSCLORS=GxFxCxDxBxegedabagaced

# enable coloring
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

# CDs
setopt auto_cd
alias sudo='sudo '
alias ...='cd ../..'
alias ....='cd ../../../'

if [ -x "`which nvim`" ]; then
    alias vi=nvim
    alias vim=nvim
fi 

# monogusa aliases
alias cD='cd ~/dotfiles'
# Logs will be saved in .zsh_history
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
## 開始と終了を記録
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_space

# Replace command history search with peco.
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function changetitle {
  # pwdを二回も実行しているのがなんかダサい...
  current_dir=`pwd | sed -e "s%\(/\([^.]\|\..\)\)[^/]*%\1%g"``pwd | sed -e "s%^.*/\([^.]\|\..\)\([^/]*\)$%\2%"`
  # タイトル用に整形
  title=[${USER}@${HOST%%.*}]${current_dir}
  case "${TERM}" in
    xterm*|kterm*|rxvt*)
      echo -ne "\033]0;${title}\007"
    ;;  
    screen*)
      echo -ne "\033P\033]0;${title}\007\033\\"
    ;;  
  esac
}

# zsh起動時にとりあえず実行
changetitle

# cd実行後に変更
function chpwd() {
  changetitle
}

# Screenの場合、window切り替え時に前のwindowのタイトルがTerminal(＆タブ)のタイトルとして
# 残ってしまうのでせめてcdコマンド以外のコマンドでも実行前にタイトルを変更
preexec () {
  changetitle
}

# Load local config
LOCALCONFIG="$HOME/.zshrclocal"
if [ -f "$HOME/.local/bin" ] ; then
    source $LOCALCONFIG
fi

