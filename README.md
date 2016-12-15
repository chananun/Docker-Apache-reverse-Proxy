# docker-apache-reverse-proxy
docker-apache-reverse-proxy

# Getting startd
1. Modify mod_proxy/conf.d/xxx-80.conf   #for you configuration
2. add cert in ssl forder . #remark if you only used http can't add cert file
3. modify file docker_entrypoint.sh for change your location

# how to start 
```
./start_images.sh
```

#how to shell internal
./shell.sh

#how to reload apache form out site
./r_apache.sh

