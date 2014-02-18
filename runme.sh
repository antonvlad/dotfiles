#!/bin/sh

TOKEN_FILE=~/.gitlab_token

if [ ! -f "$TOKEN_FILE" ]; then
# we don't have an existing token 
    echo -n "Enter GitLab password for avladimirov:"
    read -s password
    token=$(curl --data "login=avladimirov&password=$password" "https://gitlab.sd.apple.com/api/v3/session" | python -c "import json, sys; print json.load(sys.stdin)['private_token']")
    echo $token > $TOKEN_FILE
fi

token=$(cat $TOKEN_FILE)
curl -L --header "PRIVATE-TOKEN:$token" "https://gitlab.sd.apple.com/api/v3/projects/6355/repository/blobs/master?filepath=setup.sh" | sh