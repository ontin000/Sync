#!/bin/bash

cd /tmp

echo "$(curl -s https://www.gasbuddy.com/home\?search\=23314\&fuel\=1\&maxAge\=0\&method\=all | grep -i -o ".\{0,0\}__price___.\{0,12\}" | cut -d '>' -f2 | head -n 1)" > /tmp/gasprice
cat /tmp/gasprice
