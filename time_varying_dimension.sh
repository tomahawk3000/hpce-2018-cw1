#!/usr/bin/env bash

# usage: ./time_vary_dimension [source]

BIN=$1

for iter in 1 128 512 1024 2048 4096; do
    d="-height ${iter} -width ${iter}"
    eval "{ time ${BIN} ${d} > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} ${d} -engine parallel_inner > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} ${d} -engine parallel_outer > /dev/null; } 2>&1 |& grep real"
    eval "{ time ${BIN} ${d} -engine parallel_both > /dev/null; } 2>&1 |& grep real"
    echo "dimension = ${iter}x${iter}"
    echo
done