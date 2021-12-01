FROM jordan/rundeck:3.4.6

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt update && apt install -y php \
    apache2 libapache2-mod-auth-openidc \
    locales locales-all sshpass \
    python3 python3-cryptography python3-dev python3-pip python3-setuptools python3-wheel && \
    pip3 install ansible==4.9.0

RUN mkdir /var/www/oauth && \
    a2enmod ssl auth_openidc proxy_http headers

ADD ./supervisord/apache2.conf /etc/supervisor/conf.d/apache2.conf
ADD ./apache2/conf.d/rundeck-oidc.conf /etc/apache2/conf-enabled/rundeck-oidc.conf

ADD ./rundeck/rundeck-config.properties /etc/rundeck/rundeck-config.properties
