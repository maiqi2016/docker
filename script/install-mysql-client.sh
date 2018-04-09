#!/bin/bash

source $(cd `dirname $0`; pwd)/library.sh

#
# Install command `php`
#
if [ `cat ${profile} | grep 'alias mq-mysql' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysql`'
    echo "alias mq-mysql='mq-container-mysql mysql'" >> ${profile}
    color 34 'You can use command `mq-mysql` substitution `mysql` now'
fi

if [ `cat ${profile} | grep 'alias mq-mysqldump' | wc -l | awk '{print $1}'` == 0 ]; then
    color 35 'Build alias for run `mysqldump`'
    echo "alias mq-mysqldump='mq-container-mysql mysqldump'" >> ${profile}
    color 34 'You can use command `mq-mysqldump` substitution `mysqldump` now'
fi

color 32 'Completed configure.'
color 33 "You should run the command manually\n\n    source ${profile}"

# -- eof --