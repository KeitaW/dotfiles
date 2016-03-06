"w!!でスーパユーザとして保存可能にする
cmap w!! w !sudo tee % > /dev/null 
" 入力モード時に素早くhhと入力した場合にESCとみなす
inoremap hh <ESC>
" j,kによる移動を折り返されたテキストでも自然に振る舞うようにする
nnoremap j gj
nnoremap k gk
