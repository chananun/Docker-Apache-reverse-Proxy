#!/bin/bash
#img=`docker images |grep chananun/apache2-reverse-proxy-ssl`
echo $img
hw="/home/devops/p_apache/files" 
chw=`pwd`
if [ "$hw" == "$chw" ] 
then
docker run -d -h www.anyresolve.com \
   -p 188.166.243.131:80:80 -p 188.166.243.131:443:443 \
	--name proxy \
	-v $(pwd)/ssl:/ssl:ro \
	-v $(pwd)/logs/proxy:/var/log/apache2 \
	-v $(pwd)/mod_proxy/conf.d:/mod_proxy/conf.d \
chananun/apache2-reverse-proxy-ssl
else
	echo "Please start @ /home/devops/p_apache/file"
fi
