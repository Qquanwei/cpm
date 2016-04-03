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

本地`c`库存放于`cinclude`中，在`cinclude`中存放每个`c`库的版本库(`git`). 同时会有一个软链接指向仓库中的主头文件。

例如，安装`clist`后，`cinclude`看起来像下面这样
```shell

    cinclude
    ├── clist
    │   └── clist.h
    └── clist.h -> ./clist/clist.h

    1 directory, 2 files

```
在使用时可以在主文件中加入 `#include "cinclude/clist.h"` 进行引用。


## options

0.0.1版本支持的options:

* `install` 如果后面有文件则搜索指定`c`库进行安装，并将其记录到`.cpm.config`文件中,如果没有文件则默认安装 .cpm.config 中配置的`c`库 
* `update` 不需要参数，更新本地`cpmlist`仓库
* `search` 需要一个参数，搜索含有该参数的软件库名称
* `remove` 移除一个`c`库

## 使用说明

* 安装helloworld : `cpm install helloworld`
* 搜索helloworld : `cpm search helloworld`
* 更新本地仓库列表 : `cpm update`
* 卸载helloworld : `cpm remove helloworld`
* 查看已安装的包: `cpm ls`
* 查看无记录的包: `cpm autoclean`
