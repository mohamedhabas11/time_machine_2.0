# Make executable with chmod +x <<filename.sh>>

source env.sh
source install.sh

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "**Working on creating the repo**"


echo "Enter a repo description: "
read DESCRIPTION


# step 2:  the local project folder path
echo "what is the absolute path to your local project directory?"
read PROJECT_PATH

# step 3 : go to path 
cd "$PROJECT_PATH"


# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'initial commit -setup with .sh script'


# step 5 use github API to log the user in
curl -u ${User_name} https://api.github.com/user/repos -d "{\"name\": \"${repo_name}\", \"description\": \"${DESCRIPTION}\"}"

#  step 6 add the remote github repo to local repo and push
git remote add origin https://github.com/${User_name}/${repo_name}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
cd "$PROJECT_PATH"

echo "Done. Go to https://github.com/$User_name/$repo_name to see." 
echo " *** You're now in your project root. ***"