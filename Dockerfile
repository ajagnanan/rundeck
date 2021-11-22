FROM jordan/rundeck:3.4.6

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    apt clean && \
    apt update && \
    locale-gen en_US.UTF-8

RUN pip3 install ansible
