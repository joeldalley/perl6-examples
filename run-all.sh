#!/usr/bin/env bash
for i in $(ls *.p6); do
    perl6 $i > output/out.$i
done
