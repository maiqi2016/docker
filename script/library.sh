#!/bin/bash

function color()
{
    color=$1
    message=$2
    begin=${3-"\t\n"}
    end=${4-"\t\n"}

    echo -e "${begin}\033[1;${color}m${message}\033[0;0m${end}"
}

profile=~/.bash_profile

sudo docker --version | grep 'Docker version' > /dev/null

if [ $? != 0 ]; then
    color 31 'Must install docker first'
    exit 9
fi

if [ ! -f ${profile} ]; then
    color 35 "Touch file '${profile}'"
    touch ${profile}

    (
cat <<'EOF'
source ~/.bashrc

alias iload="source ~/.bash_profile"
alias ivim="sudo vim ~/.bash_profile"

EOF
) >> ${profile}
fi

if [ `cat ${profile} | grep 'alias mq-container-fpm' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias mq-container-fpm=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep 'mq-fpm' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias mq-container-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias mq-container-mysql=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep 'mq-mysql' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias mq-container-nginx' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias mq-container-nginx=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep 'mq-nginx' | awk '{print \$1}'\`\"" >> ${profile}
fi

if [ `cat ${profile} | grep 'alias mq-container-python' | wc -l | awk '{print $1}'` == 0 ]; then
    echo "alias mq-container-python=\"sudo docker exec -it \`sudo docker ps -a --format='table {{.ID}}\t{{.Names}}' | grep 'mq-python' | awk '{print \$1}'\`\"" >> ${profile}
fi

# -- eof --