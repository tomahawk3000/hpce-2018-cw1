#!/usr/bin/env bash

BIN=$1

for n in 10 20 30 40 50 60 70 80 ; do
    eval "time ${BIN} -width ${n} -height ${n} > /dev/null"
    echo "N = ${n}"
done