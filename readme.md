#CPM
`c`程序软件库管理器,0.0.1版。

## 介绍
`c`的程序库寻找过程太麻烦，`cpm`为了方便安装使用`c`库而生，强调一下`npm只为c提供库的安装，不包含cpp部分`,如果你需要`cpp`部分的常用库，`stl`,`boost`相信能完成你的需求

## 计划

* clist
* chttp
* cmap

## 软件库列表
软件库列表新建为 `git@github.com:Qquanwei/cpmlist.git` ,可通过Push新列表更新库源。需要使用`git`功能,本地的源仓库在`~/.cpm/cpmlist`中，每次执行`install`时通过执行--判断是否存在本地`cpmlist`仓库--查找`c`库地址--下载--这一流程进行`c`库的安装。执行`update`时更新本地源。
