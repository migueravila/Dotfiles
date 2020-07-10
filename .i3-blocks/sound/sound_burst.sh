#!/bin/sh
for i in $(seq 1 5)
do
    sleep 0.2
    pkill -RTMIN+1 i3blocks
done
