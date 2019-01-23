#!/usr/bin/env bash

BIN=$1

for iter in 1 10 100 1000 10000 100000 1000000 ; do
    eval "time ${BIN} -max-iter ${iter} > /dev/null"
done


