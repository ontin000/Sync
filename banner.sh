#!/usr/bin/zsh

echo $(date +%H:%M)  $(hostname) $(uname -r) #$(echo "Gas:")$(~/Sync/gas_grabber.sh) $(echo "BTC:$")$(ssh linuxhead 'cat /tmp/bcprice') #$(~/bin/kernel.sh) 
#echo $(date +%H:%M) $(hostname) $(uname -r) $(~/bin/kernel.sh)
#awk -F\" 'NR==3{print $2}' ~/bin/wt
#ssh do 'tail -n 1 Spark.ssv'
