#! /bin/bash

echo
read -p "Please give a gitlab user name: " gitlabUsername
if [ -z "${gitlabUsername}" ]
then
    echo -e "\n\033[31mGitlab user name is required!\033[0m\n"
    exit 1
fi

echo
read -p "Please give a project clone path [~/Documents/MQ] : " projectDirectory
if [ -z "${projectDirectory}" ]
then
    projectDirectory=~/Documents/MQ
fi

projects=(
    source
    kake
    service
    passport
    kake-mini-program
)

remoteRepo=maiqi2016
for project in ${projects[*]}
do
    git="git@github.com:${gitlabUsername}/${project}.git"

    if [ ! -e ${projectDirectory}/${project} ]
    then
        cd ${projectDirectory}
        echo -e "\n\033[32m -(run)-> git clone ${git} \033[0m\n"
        git clone ${git}
    else
        echo -e "\n\033[33m -(exists)-> ${git} \033[0m\n"
    fi

    cd ${projectDirectory}/${project}
    _git=${git//${gitlabUsername}/${remoteRepo}}

    echo -e "\n\033[32m -(run)-> git remote add ${remoteRepo} ${_git} \033[0m\n"
    git remote add ${remoteRepo} ${_git}
done

git config core.ignorecase false

echo -e "\n\033[32mDeveloper for local init complete!\033[0m\n"

# -- eof --
