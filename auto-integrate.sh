#!/bin/bash
echo '[+] - Copy file in folder conf.d to /etc/logstash/conf.d/'
sudo cp conf.d/* /etc/logstash/conf.d/

echo '[+] - Copy file pipline.yml to /etc/logstash/'
sudo cp pipelines.yml /etc/logstash/

echo '[+] - Copy file logstash.yml to /etc/logstash/'
sudo cp logstash.yml /etc/logstash/

if [ "$#" -eq  "0" ]
then
  echo '[DONE]'
elif [ $1 = 'restart' ]
then
  source ./auto-retart-logstash.sh
fi
