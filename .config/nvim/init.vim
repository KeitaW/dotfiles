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
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-



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
call dein#add('ryanoasis/vim-devicons')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/Defx.nvim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('edkolev/tmuxline.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('davidhalter/jedi-vim')
call dein#add('zchee/deoplete-jedi')
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
call dein#add('Vimjas/vim-python-pep8-indent')
call dein#add('scrooloose/syntastic')
call dein#add('qpkorr/vim-bufkill')
call map(dein#check_clean(), "delete(v:val, 'rf')")
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
" Denite settings
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" lib clang
if has('mac')
    let g:deoplete#sources#clang#libclang_path='/usr/local/bin/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header='/usr/local/bin/include/clang'
endif
if has('unix')
    let g:deoplete#sources#clang#libclang_path='/usr/lib64/llvm/libclang.so'
    let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
endif
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

""" yank to remote
"let g:y2r_config = {
"            \   'tmp_file': '/tmp/exchange_file',
"            \   'key_file': expand('$HOME') . '/.exchange.key',
"            \   'host': 'localhost',
"            \   'port': 52224,
"            \}
"function Yank2Remote()
"    call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
"    let s:params = ['cat %s %s | nc -w1 %s %s']
"    for s:item in ['key_file', 'tmp_file', 'host', 'port']
"        let s:params += [shellescape(g:y2r_config[s:item])]
"    endfor
"    let s:ret = system(call(function('printf'), s:params))
"endfunction
"nnoremap <silent> <undean#addique> <Leader>y :call Yank2Remote()<CR>

let g:syntastic_python_checkers = ["flake8"]
nnoremap @p :T python %<CR> <c-w>j <c-w>k
nnoremap @P :T python %<CR> <c-w>j

" set nolist  " 不可視文字をデフォルトでは表示しない
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"let g:syntastic_python_checker_args='--ignore=E731'
let g:syntastic_python_flake8_post_args='--ignore=E731'

nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'


" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
set ambiwidth=double
set laststatus=2
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '⭠'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)
if has('gui_running')
    set guifont=Fira\ Mono\ for\ Powerline
endif

