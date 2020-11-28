
#!/usr/bin/env bash
source github_token.sh
cd "$(dirname $0)"
credintials=/github_token.sh
user_name=${User_name}
access_token=${access_token}

if [ -f "${credintials}" ] ; then
	read -p "Enter Github Username  " ${User_name}
fi
if [ -f "${credintials}" ] ; then
	read -p "Enter Github access token " ${access_token}
fi
