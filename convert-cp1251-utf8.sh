#!/bin/bash

# Decode cp1251 to utf8 and change meta

find ./ -name "*.php" -o -name "*.html" -o -name "*.css" -o -name "*.js"  -type f |
while read file
do
  echo " $file"
  mv $file $file.icv
  iconv -f WINDOWS-1251 -t UTF-8 $file.icv > $file
  rm -f $file.icv
  sed -i 's/windows-1251/utf-8/g' "$file"
done
