#!/usr/bin/env bash

BIN=$1

for iter in 1 100 10000 50000 100000 500000 1000000 ; do
    eval "time ${BIN} -max-iter ${iter} > /dev/null"
    echo "Max_iter = ${iter}"
done


