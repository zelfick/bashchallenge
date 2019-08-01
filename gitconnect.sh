#!/bin/bash
#This script connects to a git repository
read -p "Give repository domain " domain
read -p "Give repository name " reponame
read -p "Give username " username
#read -p "Give password " password
read -p "HTTPS or SSH connection " connection

# The git command to use
#git@github.com:zelfick/secondbashchallenge.git
#https://github.com/zelfick/secondbashchallenge.git

case $connection in
  HTTPS|https)

    sudo git clone $connection://$domain/$username/$reponame.git
    ;;

  SSH|ssh)
     sudo git clone git@$domain:$username/$reponame.git 
     ;;

  *)
     echo "Option not valid"
     ;;
esac

