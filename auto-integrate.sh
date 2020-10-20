#!/bin/bash

sudo cp conf.d/* /etc/logstash/conf.d/
sudo cp pipelines.yml /etc/logstash/
sudo cp logstash.yml /etc/logstash/

if [ $1 = 'restart' ]
then
  source ./auto-retart-logstash.sh
fi
