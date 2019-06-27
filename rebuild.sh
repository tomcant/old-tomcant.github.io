curl -X PUT -H "Authorization: token 74212bd9ba78f6ebe67cc51ef6585a49ab4c0ecd" \
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
