#!/bin/bash

read -p "Container id or name: " container
read -p "Output file: " out
    
while :
do

    if [ $(docker ps -a | grep -c $container) -eq 1 ]; then

        docker logs --details $container >& $out
        break

    elif [ $(docker ps -a | grep -c $container) -gt 1 ]; then

        echo 'Please be more specific with the container id.'
        continue

    elif [ $(docker ps -a | grep -c $container) -lt 1 ]; then

        echo 'The container doesnt exist.'
        continue

    fi

done