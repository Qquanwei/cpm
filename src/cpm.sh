#!/bin/bash
if [ $# -gt 0 ];then
  ./cpm_${1}.sh $2
else
  ./cpm_help.sh
fi



