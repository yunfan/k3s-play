#!/bin/sh

CWD="/tmp"

cd $CWD

wget https://github.com/txthinking/brook/releases/latest/download/brook_linux_amd64 -O ${CWD}/brook

chmod +x ${CWD}/brook


${CWD}/brook wsserver -l 0.0.0.0:9999 -p ${PASSWORD}

