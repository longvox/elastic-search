sudo kill -TERM $(ps -ef | grep logstash | awk '{print $2}' )
sudo service logstash stop
sudo service logstash start
