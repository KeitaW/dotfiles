" Configuration file for vim
set modelines=0		" CVE-2007-2438
filetype plugin indent off
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set clipboard+=unnamed
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set number		" 行番号表示
set wrapscan		" enable cyclic serch
syntax on		" シンタックスハイライト
set scrolloff=5		" カーソルの移動時にカーソルが行末よりちょっと上にあるようにする
set vb t_vb=		" erase beep sound
set novisualbell
set list		" making invisible character visible	
set listchars=eol:↲,tab:>-,trail:~,extends:>,precedes:<
set tabstop=4
set autoindent		" set newline's tab in the same way as previous one
set expandtab
set shiftwidth=4
set matchtime=3		" 対応するカッコの表示時間を3秒に
set cindent			" C言語用のインデント（様子見）
" ~/.pyenv/shimsを$PATHに追加
"  jedi-vimやvim-pyencのロードよりも先に行う必要がある、はず。
let $PATH = "~/.pyenv/shims:".$PATH
"w!!でスーパユーザとして保存可能にする
cmap w!! w !sudo tee % > /dev/null 
" 入力モード時に素早くhhと入力した場合にESCとみなす
inoremap hh <ESC>
" j,kによる移動を折り返されたテキストでも自然に振る舞うようにする
nnoremap j gj
nnoremap k gk
