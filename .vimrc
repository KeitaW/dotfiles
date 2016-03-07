" autoload以下のディレクトリをちゃんと読みこむよう設定をすること
" http://wakame.hatenablog.jp/entry/2014/09/05/085345 あたりを参考にしてやること
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set clipboard+=unnamed
set backspace=2		" more powerful backspacing
set number		"show line number 
set wrapscan		" enable cyclic serch
set scrolloff=5		" カーソルの移動時にカーソルが行末よりちょっと上にあるようにする
set vb t_vb=		" erase beep sound
set novisualbell
set matchtime=3		" 対応するカッコの表示時間を3秒に
"w!!でスーパユーザとして保存可能にする
cmap w!! w !sudo tee % > /dev/null 
" 入力モード時に素早くhhと入力した場合にESCとみなす
inoremap hh <ESC>
" j,kによる移動を折り返されたテキストでも自然に振る舞うようにする
nnoremap j gj
nnoremap k gk
"
" A (not so) minimal vimrc. (retrieved from https://github.com/mhinz/vim-galore/blob/master/content/minimal-vimrc.vim)
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocomptaible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" 下記は導入するかどうか検討中
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files 
" set backup
" set backupdir   = /tmp/
" set backupext   =-vimbackup
" set backupskip  =
" set directory   =$HOME/.vim/files/swap//
" set updatecount =100
" set undofile
" set undodir     =$HOME/.vim/files/undo/
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo
