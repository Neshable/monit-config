#!/bin/bash
# install monit
apt-get install monit

#chown monit:monit /usr/local/bin/monit
#chown monit:monit /usr/local/bin/promtool

# copy conf files
cp ./conf.d/* /etc/monit/conf.d/

# copy slack.sh
cp ./slack/slack.sh /usr/local/bin/
chmod +x /usr/local/bin/slack.sh

# set up slack URL
echo 'Enter your slack webhook url:'
read url
echo $url > ./slack/slack-url

# run monit
monit

# show output
OUTPUT="$(sudo monit status)"    
echo $OUTPUT

