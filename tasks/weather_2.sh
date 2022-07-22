#!/bin/bash
IFS=' '
orasel=""
tempi=""
vremusa=""

if [[ "$1"=~[A-Z] ]]; then
    orasel=$1
elif [[ "$1"=~[a-z] ]]; then
    vremusa=$1
else tempi=$1
fi

if [[ "$2"=~[A-Z] ]]; then
    orasel=$2
elif [[ "$2"=~[a-z] ]]; then
    vremusa=$2
else tempi=$2
fi

if [[ "$3"=~[A-Z] ]]; then
    orasel=$3
elif [[ "$3"=~[a-z] ]]; then
    vremusa=$3
else tempi=$3
fi

if test $# -eq 3
then
    echo "$orasel $tempi $vremusa" >> /home/student/tema3-scripts-output/weather.info
    if test $(ls /home/student/tema3-scripts-output | grep "live.info" | wc -1) -eq 0
    then touch /home/student/tema3-scripts-output/live.info
    fi
    
    if test $(ls /home/student/tema3-scripts-output/live.info | grep $orasel | wc -1) - eq 0
    then echo "$orasel $tempi $vremusa" >> /home/student/tema3-scripts-output/live.info
    else
          while read oras temp vreme;do
          if test $oras = $orasel
          then sed -i "s/$oras $temp $vreme/$orasel $tempi $vremusa/g" /home/student/tema3-scripts-output/live.info
          fi
          done < /home/student/tema3-scripts-output/live.info
    fi
fi
