#!/bin/sh

BASE=$(dirname $(realpath $0))

echo ${BASE}
cd ${BASE}

ctl="kubectl"
cmname="wetty-entry"

${ctl} apply -f ./pvc.yaml

${ctl} delete -f deploy.yaml
${ctl} create -f deploy.yaml

