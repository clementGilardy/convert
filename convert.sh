#!/bin/bash
# Convertisseur de musique m4a en mp3
if [ $# -gt 1  ] ; then
    if [[ $1 == "-mp3" ]] ; then
        for t in "${@:2}"
        do
            echo ${t}
            echo "Converting ${t} in ${t%.wav}"
            faad "${t}"
            echo "Converting ${t%.wav} in ${t%.mp3}"
            lame "${t%.m4a}.wav" "${t%.m4a}.mp3"
            rm "${t%.m4a}.wav"
            rm "${t}"
        done 
    fi

    if [[ $1 == "-wav" ]] ; then
        for t in "${@:2}"
        do
            echo "Converting ${t} in ${t%.wav}"
            faad "${t}"
            rm "${t}"
        done
    fi
fi
