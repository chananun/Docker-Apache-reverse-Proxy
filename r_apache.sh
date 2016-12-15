#!/bin/bash
img="chananun/apache2-reverse-proxy-ssl"
cont=`docker ps -a|grep -v CONTAINER|grep $img|awk '{print $1}'`
docker exec -it  $cont apachectl -k graceful
echo done
