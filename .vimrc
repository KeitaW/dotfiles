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
" \cでカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
" for some reasons these setting won't work
 nmap \c <Plug>(caw:I:toggle)
 vmap \c <Plug>(caw:I:toggle)
"
 " \C でコメントアウトの解除 
 nmap \C <Plug>(caw:I:uncomment)
 vmap \C <Plug>(caw:I:uncomment)
"let g:quickrun_config={'_' : {'split': 'holizontal'}}
let g:quickrun_config={ '_' : { "outputter/buffer/split":":botright"}}
let s:hook = {"name" : "clear_quickfix","kind" : "hook"}
let g:quickrun_config['markdown']={ 'outputter': 'browser'}
let g:quickrun_config['cpp'] = { 'cmdopt': '-std=c++11' }

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif 


" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'
" DJANGO_SETTINGS_MODULE を自動設定
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
    " 指定されたコマンドが実行され vimproc がコンパイルされる
NeoBundle "Shougo/vimproc", {
\ "build": {
	\   "windows"   : "make -f make_mingw32.mak",
	\   "cygwin"    : "make -f make_cygwin.mak",
	\   "mac"       : "make -f make_mac.mak",
	\   "unix"      : "make -f make_unix.mak",
	\ }}
" 補完用に jedi-vim を追加
NeoBundle "davidhalter/jedi-vim"
" Markdown環境用のプラグイン
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" pyenv 処理用に vim-pyenv を追加
" Note: depends が指定されているため jedi-vim より後にロードされる（ことを期待）
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

