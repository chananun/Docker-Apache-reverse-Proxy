FROM alpine:3.2
MAINTAINER Chananun Promswat <spromswat@gmail.com>

ADD tcp/limits.conf /etc/security/limits.conf
ADD tcp/sysctl.conf /etc/sysctl.conf

RUN /usr/sbin/deluser apache && \
    addgroup -g 50 -S apache && \
    adduser -u 1000 -g apache -G apache -S apache && \
    apk --update add apache2-ssl apache2-proxy apache2-proxy-html apache2-utils vim gzip tzdata bash && \
    rm -f /var/cache/apk/* && \
    echo "Setting system timezone to Asia/Bangkok..." && \
    ln -snf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime && \
    echo "Setting up ntpd..." && \
    echo $(setup-ntp -c busybox  2>&1) && \
    ntpd -d -p pool.ntp.org && \
    echo "Installing composer..." && \
    mkdir /var/www/html && \
    rm /etc/apache2/conf.d/proxy-html.conf && \ 
    chown -R apache:apache /var/www/html

ADD apache/httpd.conf /etc/apache2/httpd.conf
ADD apache/ssl.conf /etc/apache2/conf.d/ssl.conf
ADD docker_entrypoint.sh /docker_entrypoint.sh

WORKDIR /var/www/html

VOLUME [ "/var/www/html" ]
#VOLUME [ "/var/log/newrelic" ]

EXPOSE 80 443

ENTRYPOINT ["/docker_entrypoint.sh"]

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
