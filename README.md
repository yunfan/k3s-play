# k3s相关脚本

这里保存的我vps部署k3s的脚本 目标环境为

===============  =================
    cpu             2 vcpu
    memory          2G
    os              alpine 3.14
    k3s             latest
===============  =================

实际上 1vcpu+1Gram也能跑

需要注意的是 这个配置是针对单机集群的，没在多节点集群测试过

使用时请在一台裸alpine集群上按照k3s官方提醒的 alpine linux额外步骤

先设置下 kernel的cmdline

然后跑 `bootstrap.sh`

`deploys` 目录下是各种部署目标
