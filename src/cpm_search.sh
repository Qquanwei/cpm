#!/bin/bash

# 从 ${HOME}/.cpm/cpmlist/readme.md 中搜索文件

function print_usag_and_exit(){
  echo '参数错误'
  echo '  $1 hellowold'
}

PATH="${HOME}/.cpm/cpmlist/readme.md"

if [ $# -gt 0 ];then
  /usr/bin/grep $1 ${PATH}
else
  print_usag_and_exit $0
fi