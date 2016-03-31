#!/bin/bash

# 将文件添加进本地仓库
# 规则: 将文件添加到本地cinclude中

function print_usag_and_exit(){
  echo "err params:"
  echo "       ${1} header.h"
}
if [ "$#" = "1" ];then
  mkdir cinclude 2>/dev/null
  filename=$1
  if [ "${filename:0:4}" = "http" ];then
    wget -nv -c --progress=bar -T 1200 -P "$(pwd)/cinclude" $filename
  else
    \cp -f $1 "cinclude/"
  fi
else 
  print_usag_and_exit $0
fi
