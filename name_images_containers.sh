#!/bin/bash

read -p "Options:
         
         1) Tag Image
         2) Name or rename container
         " action

case "$action" in 

    1)
        printf 'Tag Image\n'

        while :
        do

            read -p "Image id or name: " image

            if [ $(docker images | grep -c $image) -eq 1 ]; then

                read -p "Image name: " name
                read -p "Image version: " version
                read -p "Repository name: " repository

                read -p "Private repository? [y/n]: " private

                while :
                do

                    if [[ "${private,,}" = y || "${private,,}" = yes ]]; then

                        read -p "Registry name and (if needed) port: " registry

                        if [ -z $version ]; then 

                            docker tag $image ${registry}/${repository}/${name}
                            break

                        else
                    
                            docker tag $image ${registry}/${repository}/${name}:${version}
                            break
                        fi 

                        elif [[ "${private,,}" = n || "${private,,}" = no ]]; then

                            if [ -z $version ]; then 

                                docker tag $image ${repository}/${name}
                                break

                            else
                    
                                docker tag $image ${repository}/${name}:${version}
                                break

                            fi 
                    
                    else 

                        printf 'Please type y or n'
                        continue

                    fi

                done

            elif [ $(docker images | grep -c $image) -gt 1 ]; then

                printf 'Please be more specific with the image id.\n'
                continue

            elif [ $(docker images | grep -c $image) -lt 1 ]; then
                
                printf 'There are no images with the given id.\n'
                continue

            fi
        done
        ;;

    2)  
        printf 'Name or rename container\n'
        read -p "Run container from image? [y/n]: " run

        while :
        do

            if [[ "${run,,}" = y || "${run,,}" = yes ]]; then

                read -p "Image id: " image

                if [ $(docker images | grep -c $image) -eq 1 ]; then

                    read -p "Name container: " container
                    docker run -d --name $container $image
                    break

                    elif [ $(docker images | grep -c $image) -gt 1 ]; then

                        printf 'Please be more specific with the image id.\n'
                        continue

                    elif [ $(docker images | grep -c $image) -lt 1 ]; then

                        printf 'There are no images with the given id.\n'
                        continue

                else 

                    printf 'Please type y or n\n'
                    continue

                fi

            fi

            break

        done

        read -p "Rename container? [y/n]: " rename

        while :
        do

            if [[ "${rename,,}" = 'y' || "${rename,,}" = 'yes' ]]; then

                read -p "Container id or name: " container

                if [ $(docker ps -a | grep -c $container) -eq 1 ]; then

                    read -p "Name container: " newcontainer
                    docker rename $container $newcontainer
                    break

                    elif [ $(docker ps -a | grep -c $container) -gt 1 ]; then

                        printf 'Please be more specific with the container id.\n'
                        continue

                    elif [ $(docker ps -a | grep -c $container) -lt 1 ]; then

                        printf 'There are no containers with the given id.\n'
                        continue

                else 

                    printf 'Please type y or n\n'
                    continue

                fi

            fi
        
            break

        done
        ;;

esac