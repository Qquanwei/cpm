#!/bin/bash

INSTALL_DIR=$(pwd)
SCRIPT_PATH=$(dirname $0)

#参数: 已经存在的包名
function exists(){
  packname=$(basename $1)
  ${SCRIPT_PATH}/cpm_search.sh ${packname} | while read line;do
    oripackname=$(echo $line | cut -d " " -f 1);
    if [ "${oripackname}" = "${packname}" ];then
      exit 1;
    fi
  done
  if [ $? -eq 0 ];then
    >&2 echo "软件包 [ cinclude/${packname} ] 不在记录中"
  fi
}

if [ -d "${INSTALL_DIR}/cinclude" ];then
  for i in $(find ${INSTALL_DIR}/cinclude/* -maxdepth 0 -type d); do
    exists $i
  done
fi
