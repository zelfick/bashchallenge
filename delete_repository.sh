read -p "Repository route: " repository

if [ -d $repository ]; then
    
    rm -rf $repository

else 

    echo "The repository doesn't exist."

fi
