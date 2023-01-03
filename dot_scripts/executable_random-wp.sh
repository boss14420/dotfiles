#!/usr/bin/bash
img=(`find ~/Pictures/wallpapers/ -name '*' -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d':' -f1`)
while true
do
   feh --bg-max "${img[$RANDOM % ${#img[@]} ]}"
sleep 30m
done
