#!/bin/bash

function print_and_exit(){
  echo 'hi jack'
}

INSTALL_PATH=$(pwd)
if [ $# -gt 0 ];then
  cd ${INSTALL_PATH}/cinclude
  packname=$1
  if [ -d "$packname" ];then
    echo '正在删除..'
    rm -rf ${INSTALL_PATH}/cinclude/$packname
    echo '删除完成'
  else
    echo "该程序库不存在:$packname"
  fi
else
  print_and_exit $0
fi
