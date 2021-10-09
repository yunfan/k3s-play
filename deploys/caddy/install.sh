#!/bin/sh

BASE=$(dirname $(realpath $0))

echo ${BASE}
cd ${BASE}

if [ -z $ctl ]; then
    ctl="kubectl"
fi

cmname="caddyfile"

${ctl} apply -f ./pvc.yaml

${ctl} delete cm ${cmname}
${ctl} create cm ${cmname} --from-file ./Caddyfile

${ctl} delete -f deploy.yaml
${ctl} create -f deploy.yaml

