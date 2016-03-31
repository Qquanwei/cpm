#!/bin/bash

# 将文件添加进本地仓库
# 规则: 将文件添加到本地cinclude中

function print_usag_and_exit(){
  echo "参数错误:"
  echo "   ${1} header.h basedir"
}
if [ "$#" -gt 0 ];then
  filename=$1
  #设置工作路径
  BASEDIR=$(pwd)
  if [  ! -z "$2" ];then
    BASEDIR=$2
  fi

  if [ ! -d "${BASEDIR}/cinclude" ];then
    mkdir -p "${BASEDIR}/cinclude"
  fi

  if [ "${filename:0:4}" = "http" ];then
    wget -nv -c --progress=bar -T 1200 -P "${BASEDIR}/cinclude" $filename
  else
    \cp -f $1 "${BASEDIR}/cinclude/"
  fi
else 
  print_usag_and_exit $0
fi
