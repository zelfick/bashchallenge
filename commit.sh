#!/bin/bash

read -p "Messages' commit: " -r Message
read -p "Description commit: " -r Description

if [ $(git config user.name) = '' ]
then
    
    read -p "Email: " -r E_mail
    read -p "Name: " -r Name
    git config user.name "$Name"
    git config user.email "$E_mail"
fi
git commit -am "$Message" -m "$Description"