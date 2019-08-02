#!/bin/bash
clear
echo "############################################################################"
echo " GIT LOGS "
echo "############################################################################"

while :
do
    read -p "Repository route: " route

    cd $route
    
    read -p "CHOOSE THE ACTION TO EXECUTE 
        1) SEE GIT LOGS WITH -ID, -AUTOR, -DATE, -MESSAGE
        2) SEE GIT LOGS IN A LINE
        3) SEE A SPECIFIC COMMIT
        4) SEE A GRAPH
        5) COME BACK 
        Action: " action

    case "$action" in
        1) 
            read -p "How many commits do you wanna see?: " Number1
            git log -$Number1
            continue
            ;;
        2) 
            read -p "How many commits do you wanna see?: " Number2
            git log --oneline -$Number2
            continue
            ;;
        3)  
            read -p "Commit ID: " Id
            git show $Id
            continue
            ;;
        4) 
            git log --all --decorate --oneline --graph
            continue
            ;;
        5)  
            clear
            sh menu.sh
            ;;
        *)  echo "Invalid Selected Option"
            break
            ;;
    esac 

done