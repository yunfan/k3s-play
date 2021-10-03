#!/bin/sh

BASE=$(dirname $(realpath $0))

echo ${BASE}
cd ${BASE}

ctl="kubectl"
cmname="caddyfile"

${ctl} delete cm ${cmname}
${ctl} create cm ${cmname} --from-file ./Caddyfile

${ctl} delete -f deploy.yaml
${ctl} create -f deploy.yaml

