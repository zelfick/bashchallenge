read -p "Repository route: " repository
read -p "Branch to commit in: " branch

if [ -d $repository ]; then
    
    cd repository 2>/dev/null
    
    if [ "$branch" = $(git branch | grep $branch | cut -d " " -f 2) ]; then

        git checkout $branch
        git push -u origin $branch
    
    else

        echo "The branch doesn't exist."
    
    fi

else 

    echo "The repository doesn't exist."

fi
