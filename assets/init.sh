#!/bin/bash

[ ! -z $EXTERNAL_NAME ] && {
    sed -i "s/localhost/$EXTERNAL_NAME/g" ${NPM_LAZY_LOCAL_PATH}/config.js
}

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
supervisorctl maintail -f &
supervisorctl tail -f npm_lazy
