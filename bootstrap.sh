#!/bin/sh

# 由于traefik+cert-manager没研究成功 并且也很吃资源
# 所以部署方案改为 使用caddy监听nodePort的80/443 接管
# http/https流量
# 也因此可以禁掉 traefik,metrics-server这些烂组件
# 同时全机的端口都应该能被当作nodePort用


curl -sfL http://get.k3s.io | \
    INSTALL_K3S_CHANNEL=latest \
    sh -s - --service-node-port-range "1-65535" --disable "traefik,metrics-server"
