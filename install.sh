#!/bin/bash
source env.sh
cd "$(dirname $0)"

# Read Repo Name
read -rep "Please Enter Repo name:  " repo_name

# Read state
read -rep "(public/private):  " state

# Feedback
echo "'$repo_name'"
echo "'$state'"
# Creating the repo
curl -u "${User_name}":${access_token} https://api.github.com/user/repos -d '{"name":"'${repo_name}'","'${state}'":"true"}'

# build image 




# Deploy image



