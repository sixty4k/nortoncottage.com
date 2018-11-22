#!/bin/bash
# based on https://gohugo.io/hosting-and-deployment/deployment-with-rsync/

HOST=bh
DIR=nortoncottage.com/   # might sometimes be empty!

hugo && rsync -avz -e ssh --delete public/ ${HOST}:~/${DIR}

exit 0
