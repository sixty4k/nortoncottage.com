#!/bin/bash

filename=$(echo "${2}" | sed -e's/ /-/g')

case "$1" in
    blog)
        hugo new blog/${filename}.md
        subl content/blog/${filename}.md
    ;;
     
    music)
        hugo new music/${filename}.md
        subl content/music/${filename}.md
    ;;
     
    project)
        hugo new project/${filename}.md
        subl content/project/${filename}.md
    ;;
    *)
        echo $"Usage: $0 [blog|music|project] \"Title of your post\""
        exit 1

esac
