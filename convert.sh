#!/bin/bash
# Convertisseur de musique m4a en mp3
if [ $# -gt 1  ] ; then
    if [[ $1 == "-mp3" ]] ; then
        for t in "${@:2}"
        do
            faad "${t}"
            lame "${t%.m4a}.wav" "${t%.m4a}.mp3"
            rm "${t%.m4a}.wav"
            rm "${t}"
        done 
    fi

    if [[ $1 == "-wav" ]] ; then
        for t in "${@:2}"
        do
            faad "${t}"
            rm "${t}"
        done
    fi
fi
