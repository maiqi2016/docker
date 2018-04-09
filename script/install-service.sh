#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

if [ `cat ${profile} | grep 'alias mq-service' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for start up service'
    echo "alias mq-service='mq-container-fpm /usr/local/init-service &'" >> ${profile}
    color 34 'You can use command `mq-service` execute for start up service'
fi

color 32 'Completed install.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --