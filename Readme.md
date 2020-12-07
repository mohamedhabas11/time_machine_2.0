# Time_machine

This repo is not a proper a CI/CD pipeline.
But it can help with saving the time when playing around with mini projects

Important !!

## Prepare local env
nano github_token.sh
nano make.sh
### Required tools

- Docker
- git
- git auth token 

## Login to docker 
	docker login -u "{Username}" -p "{Password}"  docker.io

## Create a new repo from scratch & build a pre-packed Go demo App 
  bash ./install.sh
  
  
## Build and push image to docker hub
	cd time_machine_2.0
	bash ./make.sh


### OSX tips

Fix slow docker build

	sudo gem install docker-sync

