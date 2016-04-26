#!/bin/bash

CPM_PATH="${HOME}/.cpm"
if [ ! -d ${CPM_PATH} ];then
  mkdir $CPM_PATH
fi
# 进入用户配置目录
cd $CPM_PATH

if [ ! -d "cpmlist" ];then
  git clone https://github.com/Qquanwei/cpmlist
else
  cd cpmlist
  git pull
fi
