# find . -not -name "*.pdf" -not -name "." -type f | gxargs -I{} change_encoding.sh {} SJIS UTF8
iconv -f $2 -t $3 $1 > "$1.tmp" 
mv "$1.tmp" $1
