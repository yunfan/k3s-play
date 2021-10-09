#!/bin/sh

BASE=$(dirname $(realpath $0))

echo ${BASE}
cd ${BASE}

if [ -z $ctl ]; then
    ctl="kubectl"
fi

cmname="brook-entry"

${ctl} delete cm ${cmname}
${ctl} create cm ${cmname} --from-file ./entry.sh

${ctl} delete -f deploy.yaml
${ctl} create -f deploy.yaml

