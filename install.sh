#!/bin/bash

source env.sh
source github_token.sh
source make.sh

cd "$(dirname $0)"
HOME=$(pwd) 
# Read Repo Name
read -rep "Please Enter Repo name:  " repo_name

# Read state
read -rep "(public/private):  " state

# Feedback
echo "'$repo_name'"
echo "'$state'"

# Creating the repo
curl -u "${User_name}":${access_token} https://api.github.com/user/repos -d '{"name":"'${repo_name}'","'${state}'":"true"}'

# step 1:  the local project folder path
echo "what is the absolute path to your local project directory?"
read PROJECT_PATH

# step 2 : go to path 
cd "$PROJECT_PATH"

# step 3: initialise the repo locally, create blank README, add and commit
echo "# auto_go" >> README.md
git init
git add README.md
git commit -m 'initial commit -setup with .sh script'
git branch -M main
git_push="$repo_name.git"
git remote add origin https://$access_token:x-oauth-basic@github.com/$User_name/$git_push
git push -f https://$access_token:x-oauth-basic@github.com/$User_name/$git_push

                

# go back
cd "${HOME}"


