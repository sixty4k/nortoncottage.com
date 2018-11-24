#!/bin/bash

contents_subdirs=$(ls -F content | grep '/' | cut -d'/' -f1)

filename=$(echo "${2}" | sed -e's/ /-/g')

if [[ "$contents" =~ "$1" ]]; then 
    hugo new ${1}/${filename}.md
    subl content/${1}/${filename}.md
    exit 0
else 
    echo $"Usage: ${0} [${contents_subdirs}] \"Title of your post\""
    exit 1
fi

