echo '[+] - Kill all logstash'
sudo ps -ef | sudo grep logstash | sudo awk '{kill -9 $2}'

echo '[+] - Stop logstash'
sudo service logstash stop

echo '[+] - Start logstash'
sudo service logstash start
echo '[DONE]'
