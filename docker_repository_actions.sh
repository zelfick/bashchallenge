#!/bin/bash
clear
echo "############################################################################"
echo " DOCKER REPOSITORY ACTIONS "
echo "############################################################################"

while :
do
    read -p "CHOOSE THE ACTION TO EXECUTE 

        1) LOGIN TO DOCKER 
        2) LOGOUT TO DOCKER
        3) COMMIT IMAGE
        4) PUSH TO DOCKER REPO
        5) PULL A DOCKER IMAGE
        6) COME BACK 
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
            if [[ $(docker info | grep Username) = ' ' ]]; then
                echo "Please login first"
            else
                docker logout
            fi
            continue
            ;;
        3)  
            read -p "Container's name or ID: " -r Name_id
            read -p "Repository: " -r Repo
            docker commit $Name_id $Repo
            continue
            ;;
        4) 
            read -p "Repository: " -r Repop
            docker push $Repop
            continue
            ;;
        5) 
            read -p "Image name: " -r Image
            docker pull $Image
            continue
            ;;
        6)  
            clear
            sh menu.sh
            ;;
        *)  echo "Invalid Selected Option"
            break
            ;;
    esac 

done