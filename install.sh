#!/bin/bash

SRCPATH="$(dirname $0)/src"
INSTALLPATH='/usr/local/share/cpm'

if [ ! -z "$1" ];then
  INSTALLPATH=$1
fi

if [ ! -d "$INSTALLPATH" ];then
  mkdir $INSTALLPATH
fi

cp "${SRCPATH}"/* "$INSTALLPATH/"

if [ ! -f "/usr/local/bin/cpm" ] ;then
  ln -s "$INSTALLPATH/cpm.sh" "/usr/local/bin/cpm"
fi

echo '安装成功'
