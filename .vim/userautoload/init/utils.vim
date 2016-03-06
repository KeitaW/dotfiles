
" Makefile編集時のみタブをスペースで変換しない
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
  endif
