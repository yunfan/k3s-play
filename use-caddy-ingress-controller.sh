#!/bin/sh

CWD=$(dirname $(realpath $0))

cd ${CWD}

if [ -z $KCONF ]; then
    echo "missing enviroment variable: KCONF" >&2
    exit 1
fi

if [ -z $SSLEMAIL ]; then
    echo "missing enviroment variable: SSLEMAIL" >&2
    exit 1
fi

git clone https://github.com/caddyserver/ingress
cd ingress

helm template mycaddy ./charts/caddy-ingress-controller \
    --namespace=caddy-system \
    --set image.tag=latest \
    --set ingressController.autotls=true \
    --set ingressController.email=${SSLEMAIL} \
    > ${CWD}/mycaddy.yaml;
    
# apply the file
kubectl --kubeconfig $KCONF create ns kube-system
kubectl --kubeconfig $KCONF apply -f ${CWD}/mycaddy.yaml

rm -rf ${CWD}/ingress

# use it like `KCONF=/path/of/your/k3s.yaml SSLEMAIL=yourname@example.com ./xxxx`
