#!/bin/bash
echo 安装cpm

SRCPATH="$(dirname $0)/src"
INSTALLPATH='/usr/local/share/cpm'

if [ ! -z "$1" ];then
  INSTALLPATH=$1
fi

if [ ! -d "$INSTALLPATH" ];then
  mkdir $INSTALLPATH
else
  echo $INSTALLPATH 已经存在
fi

cp "${SRCPATH}"/* "$INSTALLPATH/"

ln -s "$INSTALLPATH/cpm.sh" "/usr/local/bin/cpm"
