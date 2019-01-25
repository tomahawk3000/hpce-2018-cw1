#!/usr/bin/env bash

# usage: ./time_vary [parameter to vary] [source]

vary=$1
BIN=$2

for iter in 1 32 64 128 256 512; do
    eval "{ time ${BIN} -${vary} ${iter} > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} -${vary} ${iter} -engine parallel_inner > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} -${vary} ${iter} -engine parallel_outer > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} -${vary} ${iter} -engine parallel_both > /dev/null; } 2>&1 |& grep real"
    echo "${vary} = ${iter}"
    echo
done