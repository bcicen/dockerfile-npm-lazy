# DOCKER-VERSION 1.2.0
# DESCRIPTION    npm lazy
# TO_BUILD       docker build -t 'npm-registry' .
# TO_RUN         docker run -p 80:80 npm-registry

FROM dockerfile/nodejs:latest

MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

ADD assets/ /app/
RUN chmod 755 /app/*.sh && /app/install.sh

EXPOSE 8080

CMD /bin/bash /app/init.sh
