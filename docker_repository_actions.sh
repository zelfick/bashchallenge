#!/bin/bash
clear
echo "############################################################################"
echo " DOCKER REPOSITORY ACTIONS "
echo "############################################################################"

while :
do
    read -p "CHOOSE THE ACTION TO EXECUTE 

        1) LOGIN TO DOCKER 
        2) COMMIT IMAGE
        3) PUSH TO DOCKER REPO
        4) PULL A DOCKER IMAGE
        5) COME BACK 
        Action: " action

    case "$action" in
        1) 
            read -p "Username: " -r username
            printf "Password: " 
            read -s password
            docker login -u $username -p $password 
            continue
            ;;
        2)  
            read -p "Container's name or ID: " -r Name_id
            read -p "Repository: " -r Repo
            docker commit $Name_id $Repo
            continue
            ;;
        3) 
            read -p "Repository: " -r Repop
            docker push $Repop
            continue
            ;;
        4) 
            read -p "Image name: " -r Image
            docker pull $Image
            continue
            ;;
        *)  echo "Invalid Selected Option"
            break
            ;;
    esac 

done