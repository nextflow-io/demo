grep $1 $2 \
 | awk '$3=="transcript"' \
 | wc -l
 