"basic settings(will be moved to somewhere)----------
set number
" <C-c>がESCと同じ挙動をしてくれたほうが都合が良さそうなのでこんな感じで
inoremap <C-c> <ESC>
set expandtab           "タブをスペースに置き換える
set tabstop=4           "ファイル内の <Tab> が対応する空白の数
set shiftwidth=4        "自動インデントの各段階に使われる空白の数
set softtabstop=0       "<Tab>を押した時に挿入される空白の量(0:ts'で指定した量
set nohlsearch

" j,kによる移動を折り返されたテキストでも自然に振る舞うようにする
nnoremap j gj
nnoremap k gk
" 入力モードでのカーソル移動
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>

set showmode               " Show current mode in command-line.
syntax on
" basic terminal settings
" terminal modeESCでノーマルモードに
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-c>c <C-\><C-n>
" for clipboard
set clipboard+=unnamedplus
"End basic  settings------------


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein'))

" Required:
" Let dein manage dein
call dein#add('Shougo/dein.vim')
" Add or remove your plugins here:
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('davidhalter/jedi-vim')
call dein#add('zchee/deoplete-jedi')
call dein#add('JuliaEditorSupport/deoplete-julia')
call dein#add('zchee/deoplete-clang')
call dein#add('JuliaLang/julia-vim')
call dein#add('rhysd/nyaovim-mini-browser')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('tpope/vim-fugitive')
call dein#add('mattn/emmet-vim')
call dein#add('lervag/vimtex')
call dein#add('thinca/vim-quickrun')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()
filetype plugin indent on

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"settings for plugins------
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" lib clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/x86_64-linux-gnu/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/include/clang'
" 4strok jump powered by vim-easymotion
nmap s <Plug>(easymotion-overwin-f2)
"End settings for plugins------


" 快適な日本語入力のための設定---------------
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap ｘ x
nnoremap っd dd
nnoremap っy yy
" 日本語入力で”っh”と入力しても(hを選んだのは普段dvorakを使っているため)Enterキーで確定させればインサートモードを抜ける
inoremap <silent> っh <ESC>
" End 快適な日本語入力のための設定----------

" load local vimrc (.vimrc.local) if it exists
" from  http://qiita.com/unosk/items/43989b61eff48e0665f3
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
