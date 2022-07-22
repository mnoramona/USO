#!/bin/bash
IFS=' '

if test $# -eq 3
then
      "$1 $2 $3" >> /home/student/tema3-scripts-output/weather.info
      
    if test $(ls /home/student/tema3-scripts-output | grep "live.info" | wc -1) -eq 0
    then touch /home/student/tema3-scripts-output/live.info
    fi
    
    if test $(ls /home/student/tema3-scripts-output/live.info | grep $1 | wc -1) - eq 0
    then echo "$1 $2 $3" >> /home/student/tema3-scripts-output/live.info
    else
          while read oras temp vreme;do
          if test $oras = $1
          then sed -i "s/$oras $temp $vreme/$1 $2 $3/g" /home/student/tema3-scripts-output/live.info
          fi
          done < /home/student/tema3-scripts-output/live.info
    fi
fi
