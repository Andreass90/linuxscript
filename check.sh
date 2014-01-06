#!/bin/bash
df -H |awk '{ print $1 }'
df -H | awk '{ print $8 }'
array[1]=$0
array[2]=$1
