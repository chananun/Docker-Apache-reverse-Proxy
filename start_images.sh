#!/bin/bash
hw="/home/devops/p_apache/files" 
chw=`pwd`
if [ "$hw" == "$chw" ] 
then
docker run -d -h www.xxx.com \
   -p xx.xx.xx.xx:80:80 -p xx.xx.xx.xx:443:443 \
	--name proxy \
	-v $(pwd)/ssl:/ssl:ro \
	-v $(pwd)/logs/proxy:/var/log/apache2 \
	-v $(pwd)/mod_proxy/conf.d:/mod_proxy/conf.d \
chananun/apache2-reverse-proxy-ssl
else
	echo "Please start @ /home/devops/p_apache/file"
fi
