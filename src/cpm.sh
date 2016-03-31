#!/bin/bash
#获取实际脚本路径
SCRIPT_PATH=$(dirname $0)
if [ -L $0 ];then
  SCRIPT_PATH=$(dirname $(readlink $0))
fi

if [ $# -gt 0 ];then
  ${SCRIPT_PATH}/cpm_${1}.sh $2
else
  ${SCRIPT_PATH}/cpm_help.sh
fi
