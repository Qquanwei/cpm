#!/bin/bash

SCRIPT_PATH=$(dirname $0)
INSTALL_PATH=$(pwd)
CONFIG_NAME='.cpm.config'

function print_usag_and_exit(){
  echo 'hi'
}


#记录安装包的信息到配置文件
#$1 包名 $2 路径名称
function record_to_config(){
  packname=$1
  giturl=$2
  if [ -f "${INSTALL_PATH}/${CONFIG_NAME}" ];then
    echo '配置文件不存在'
    echo '创建配置文件 .cpm.config'
  fi
  echo "${packname} ${giturl}" >> ${INSTALL_PATH}/${CONFIG_NAME}
}

#安装包
function install_by_name_and_url(){
  packname=$1
  gitpath=$2
  #确保目录存在
  if [ ! -d "${INSTALL_PATH}/cinclude" ];then
    mkdir ${INSTALL_PATH}/cinclude
  fi
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
}

if [ $# -gt 0 ];then
  packname=$1
  intputlength=${#packname}
  success=0
  ("${SCRIPT_PATH}"/cpm_search.sh $packname | while read line;do
    #库名完全匹配
    if [ "${line:0:${intputlength}}" = "$packname" ];then
      #获取git路径
      gitpath=$(echo $line|cut -d " " -f 2)
      install_by_name_and_url ${packname} ${gitpath}
      record_to_config ${packname} ${gitpath}
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
  if [ -f ${INSTALL_PATH}/${CONFIG_NAME} ];then
    echo '正在安装'
    (cat "${INSTALL_PATH}/$CONFIG_NAME" | while read line;do
      packname=$(echo $line |cut -d " " -f 1)
      giturl=$(echo $line |cut -d " " -f 2)
      install_by_name_and_url $packname $giturl
    done)
  else
    print_usag_and_exit $0
  fi
fi
