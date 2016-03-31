#!/bin/bash

SCRIPT_PATH=$(dirname $0)
INSTALL_PATH=$(pwd)
function print_usag_and_exit(){
  echo 'hi'
}

if [ $# -gt 0 ];then
  packname=$1
  intputlength=${#packname}
  success=0
  ("${SCRIPT_PATH}"/cpm_search.sh $packname | while read line;do
    #库名完全匹配
    if [ "${line:0:${intputlength}}" = "$packname" ];then
      #确保目录存在
      if [ ! -d "${INSTALL_PATH}/cinclude" ];then
        mkdir ${INSTALL_PATH}/cinclude
      fi
      #获取git路径
      gitpath=$(echo $line|cut -d " " -f 2)
      cd $INSTALL_PATH/cinclude
      if [ -d "${INSTALL_PATH}/cinclude/${packname}" ];then
        echo "该库已存在"
        echo "尝试upgrade?"
      else
        git clone $gitpath
        #安装成功后操作
        echo '安装成功'
        echo "cinclude->${packname}"
        #如果存在readme,则显示readme.md
        cat ${INSTALL_PATH}/cinclude/${packname}/readme.md 2>/dev/null
      fi

      exit 111
    fi
  done)
  if [ ! "111" = "$?" ];then
    echo '找不到该库呢'
    echo '尝试search?'
    exit 1
  else
    exit 0
  fi

else
  print_usag_and_exit $0
fi
