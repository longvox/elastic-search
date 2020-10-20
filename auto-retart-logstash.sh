#!/bin/bash

echo '[+] - Kill all logstash'
PID=`ps -ef --sort=start_time | sudo grep logstash | head -n 1 |  awk '{print $2}'`
echo '  + Kill logstash ['${PID}'] '
sudo kill -9 $PID
echo '[+] - Stop logstash'
sudo service logstash stop

echo '[+] - Start logstash'
sudo service logstash start
echo '[DONE]'
