#!/bin/bash

CPM_PATH="${HOME}/.cpm"
if [ ! -d ${CPM_PATH} ];then
  mkdir $CPM_PATH
fi
# 进入用户配置目录
cd $CPM_PATH

if [ ! -d "cpmlist" ];then
  git clone git@github.com:Qquanwei/cpmlist.git
else
  cd cpmlist
  git pull origin master
fi
