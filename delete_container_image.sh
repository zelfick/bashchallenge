#!/bin/bash

read -p "Name docker image: " -r Image
read -p "Are you sure? [y/n]: " -r Option

if [ $Option = 'y' ] || [ $Option = 'Y' ]; then
    docker rmi $Image
else
    echo "bye"
    exit
fi