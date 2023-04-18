#!/bin/bash

#hosts=( linuxhead streambox bighead archhead )

#echo $hosts

# refresh background and wbar

#for host in $hosts; do
#  echo "trying to connect to $host"
#  ssh $host '/home/mike/bin/update_backgrounds.sh' || true
#  echo "done connecting, next loop"
#done


/home/mike/bin/update_backgrounds.sh
ssh archhead '/home/mike/bin/update_backgrounds.sh'
ssh streambox '/home/mike/bin/update_backgrounds.sh'
ssh bighead '/home/mike/bin/update_backgrounds.sh'
exit
