I'm sure it's not the shortest way to do it, but at least, it works :-)

Create the git repository

To achieve this, create the following script and name it create-git-repo.sh:

#!/bin/sh

REPO_NAME=$1
DESC=$2

GIT_SERVER=git.side-labs.org
OWNER="Jean-Christophe+Kermagoret<jck@bluexml.com>"
REPOSITORIES="/data/local/scm/git/$GIT_SERVER/repositories"
GITWEB_PROJECTS="/"
CLONEURL="https://git.side-labs.org/git/$REPO_NAME"

# create a new bare repository
cd $REPOSITORIES
sudo -u www-data git init --bare $REPO_NAME
cd $REPO_NAME
#sudo -u git touch git-daemon-export-ok

# additional set-up for Gitweb
echo "$DESC" | sudo -u www-data tee description
echo "$REPO_NAME $OWNER" | sudo -u www-data tee -a GITWEB_PROJECTS
echo "$CLONEURL" | sudo -u www-data tee cloneurl

Then to create the repo, just type the following

root# sh create-git-repo.sh YaRma "Yet Another Requisition Management Application with SIDE"
Import existing content

Second, go into the directory where is stored your existing content (not the repository for the moment!)

root# git init
root# git add .
root# git commit -m "Initial import"
root# git remote add origin /opt/local/scm/git/git.side-labs.org/repositories/YaRma.git
root# git push --all
Now, it's time to just check your installation through gitweb.