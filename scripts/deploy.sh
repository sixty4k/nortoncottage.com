#!/bin/bash
# based on https://gohugo.io/hosting-and-deployment/deployment-with-rsync/

# webhost in .ssh/config
HOST=bh
DIR=nortoncottage.com/   

hugo && rsync -avz -e ssh --delete public/ ${HOST}:~/${DIR}

rm -fr public

exit 0
