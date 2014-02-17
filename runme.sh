#!/bin/sh

# First ask for the token
echo "Enter user token for GitLab:"
read token

# TODO: add actual authentication here 
# TODO: read token from keychain or .token file

curl -L --header "PRIVATE-TOKEN : $token" "https://gitlab.sd.apple.com/api/v3/projects/6355/repository/blobs/master?filepath=setup.sh" | sh