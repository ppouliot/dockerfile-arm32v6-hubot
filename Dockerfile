FROM arm32v6/node:alpine
MAINTAINER Peter J. Pouliot <peter@pouliot.net>
RUN \
    npm install -g yo generator-hubot ;\
    mkdir /hubot ;\
    cd /hubot ;\
    yo hubot --owner='Peter J. Pouliot <peter@pouliot.net>' --name="Hubot" --description="Hubot in Arm32V6 Container" --adapter=slack --defaults ; \
    npm install \
    css-select \
    css-what \
    minimatch \
    uuid \
    hubot-jenkins-enhanced \
    hubot-github \
    hubot-ghe \
    hubot-ghe-backup-snapshot \
    hubot-ghe-external-auto \
    hubot-ghe-external \
    hubot-ghe-failure-recovery ;\
    npm uninstall hubot-heroku-keepalive ;\
    rm -rf /hubot/hubot-scripts.json
COPY external-scripts.json /hubot/external-scripts.json
COPY Dockerfile /Dockerfile
EXPOSE 8080
WORKDIR /hubot
CMD bin/hubot --adpater slack
