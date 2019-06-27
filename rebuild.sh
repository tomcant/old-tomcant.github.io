#!/bin/bash

TOKEN=$1

if [[ -z "${TOKEN}" ]]; then
  echo "Token required. Exiting..."
  exit 1
fi

curl -X PUT -H "Authorization: token ${TOKEN}" \
  https://api.github.com/repos/tomcant/tomcant.github.io/contents/.publish -d \
    '{
        "message": "Scripted rebuild",
        "committer": {
            "name": "RebuildBot",
            "email": "rebuildbot@tomcant.dev"
        },
        "content": "LnB1Ymxpc2gK",
        "sha": "3f949857e8ed4cb106f9744e40b638a7aabf647f"
    }'
