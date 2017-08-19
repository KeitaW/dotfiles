"basic settings(will be moved to somewhere)----------
set number
" <C-c>がESCと同じ挙動をしてくれたほうが都合が良さそうなのでこんな感じで
inoremap <C-c> <ESC>
set expandtab           "タブをスペースに置き換える
set tabstop=4           "ファイル内の <Tab> が対応する空白の数
set shiftwidth=4        "自動インデントの各段階に使われる空白の数
set softtabstop=0       "<Tab>を押した時に挿入される空白の量(0:ts'で指定した量
"set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>
"vimrcをスペースドットで開く
nnoremap <space>. :<C-u>tabedit $MYVIMRC<CR>
set hidden

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

" タグジャンプに関する設定
" [tag jump] カーソルの単語の定義先にジャンプ（複数候補はリスト表示）
nnoremap tj :exe("tjump ".expand('<cword>'))<CR>
" [tag back] tag stack を戻る -> tp(tag pop)よりもtbの方がしっくりきた
nnoremap tb :pop<CR>
" [tag next] tag stack を進む
nnoremap tn :tag<CR>
" [tag vertical] 縦にウィンドウを分割してジャンプ
nnoremap tv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" [tag horizon] 横にウィンドウを分割してジャンプ
nnoremap th :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" vimのリストをサクサク移動するためのキーマップ
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bprevious<CR>
nnoremap <silent> ]B :bprevious<CR>

 "quick chenge window size
"ウィンドウを下に大きくする Ctrl-E + j
"上に... Ctrl-E + k
"左に... Ctrl-E + h
"右に... Ctrl-E + l 
nnoremap [winsize] <Nop>
nmap <C-E> [winsize]
nnoremap [winsize]k :resize -3<CR>
nnoremap [winsize]j :resize +3<CR>
nnoremap [winsize]h :vertical resize +10<CR>   
nnoremap [winsize]l :vertical resize -10<CR>

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
" call dein#add('JuliaEditorSupport/deoplete-julia')
call dein#add('zchee/deoplete-clang')
call dein#add('JuliaLang/julia-vim')
call dein#add('rhysd/nyaovim-mini-browser')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('tpope/vim-fugitive')
call dein#add('mattn/emmet-vim')
call dein#add('lervag/vimtex')
call dein#add('thinca/vim-quickrun')
call dein#add('kassio/neoterm')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary.git')

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

" Neoterm
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
" let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'
" nnoremap <silent> ,tf :TREPLSendFile<cr>
" nnoremap <silent> ,tl :TREPLSendLine<cr>
" nnoremap <silent> ,ts :TREPLSendSelection<cr>
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" open terminal
nnoremap <silent> ,to :call neoterm#new()<cr>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tc :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tk :call neoterm#kill()<cr>



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
