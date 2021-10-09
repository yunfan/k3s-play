#!/bin/sh

BASE=$(dirname $(realpath $0))

echo ${BASE}
cd ${BASE}

if [ -z $ctl ]; then
    ctl="kubectl"
fi


${ctl} apply -f pvc.yaml

${ctl} delete -f deploy.yaml
${ctl} create -f deploy.yaml

