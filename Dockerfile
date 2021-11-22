FROM jordan/rundeck:3.4.6

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt update && \
    apt install -y locales locales-all && \
    apt install -y python3 python3-cryptography python3-dev python3-pip python3-setuptools python3-wheel

RUN pip3 install ansible
