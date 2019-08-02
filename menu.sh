#!/bin/bash
echo "############################################################################"
echo " PROGRAM TO AUTOMATE GIT, DOCKER AND OTHER MANIPULATION COMMANDS"
echo "############################################################################"

read -p "CHOOSE THE ACTION TO EXECUTE 

          1) WORK WITH GIT 
          2) WORK WITH DOCKER
          3) WORK WITH USEFUL SCRIPTS AND LOGS: " action

case "$action" in
    1)
        echo "###WORKING WITH GIT###"
        read -p "WHAT YOU WANT TO DO 

          1) CONNECT TO A GIT REPOSITORY
          2) CLONE A GIT REPOSITORY
          3) DELETE A REPOSITORY
          4) EXECUTE A COMMIT
          5) PUSH CODE TO GITHUB: " gitaction
        ;;
    2)
        echo "###WORKING WITH DOCKER###"
        read -p "WHAT YOU WANT TO DO 

          1) BUILD A CONTAINER FROM A REPOSITORY
          2) EXECUTE A CONTAINER (receives image, name, host port, docker port, execution mode, volume)
          3) TAG IMAGES AND NAME CONTAINERS
          4) DELETE CONTAINERS IMAGES
          5) BONUS LOGIN,PUSH, PULL TO DOCKERHUB: " dockeraction
        ;;
       
    3)  
        echo "###WORKING WITH LOGS###"
        read -p "WHAT YOU WANT TO DO 
 
          1) CAPTURE WEBPAGES ON CONSOLE
          2) GET GIT LOGS AND DISPLAY ON CONSOLE
          3) GET DOCKER LOGS AND WRITE IN A FILE 
          4) WRITE TO SYSTEMLOGS: " logsaction
        ;;
    *) echo "Invalid choice. Please choose an existing option number"
        ;;
esac
          
case "$gitaction" in
    1) 
        echo "Function pending to implement"
        ;;
    2)  sh gitconnect.sh
        ;;
    3) 
        echo "Function pending to implement"
        ;;
    4) 
        echo "Function pending to implement"
        ;;
    5) 
        echo "Function pending to implement"
        ;;
    *) echo "Invalid Selected Option"
        ;;
esac

case "$dockeraction" in
    1) 
        echo "Function pending to implement"
        ;;
    2) 
        echo "Function pending to implement"
        ;;
    3) 
        sh name_images_containers.sh
        ;;
    4) 
        sh delete_container_image.sh
        ;;
    5) 
        bash docker_repository_actions.sh
        ;;
    *)  echo "Invalid Selected Option"
        ;;
esac

case "$logsaction" in
    1) 
        sh capturepage.sh
        ;;
    2) 
        echo "Function pending to implement"
        ;;
    3) 
        echo "Function pending to implement"
        ;;
    4) 
        echo "Function pending to implement"
        ;;
    *) echo "Invalid Selected Option"
        ;;
esac
