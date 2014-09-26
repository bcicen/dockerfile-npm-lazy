#!/bin/bash

set -e

cat <<EOF>> /etc/bash.bashrc
NPM_LAZY_VERSION=v1.6.0
NPM_LAZY_GIT=https://github.com/mixu/npm_lazy.git
NPM_LAZY_LOCAL_PATH=/opt/npm_lazy
EOF

apt-get -qq update
apt-get install -y dnsutils git supervisor

#install npm_lazy
git clone "${NPM_LAZY_GIT}" "${NPM_LAZY_LOCAL_PATH}"
cd "${NPM_LAZY_LOCAL_PATH}"
git checkout "${NPM_LAZY_VERSION}"
npm install

ln -nsf /app/setup/config.js ${NPM_LAZY_LOCAL_PATH}/config.js

cat > /etc/supervisor/conf.d/npm_lazy.conf <<EOF
[program:npm_lazy]
command=${NPM_LAZY_LOCAL_PATH}/bin/npm_lazy --config ${NPM_LAZY_LOCAL_PATH}/config.js
user=root
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/supervisor/%(program_name)s.log
EOF
