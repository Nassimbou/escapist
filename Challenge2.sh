#!/bin/bash

docker stop ctf
echo '
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install sudo
RUN apt-get -y install gcc

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/PrivEscape/ -m -p PrivEscape -s /bin/rbash PrivEscape
RUN chmod 755 /home/PrivEscape 

RUN echo "PrivEscape ALL=NOPASSWD: /usr/bin/nano" >> /etc/sudoers
RUN echo "This is an important message" > /home/PrivEscape/readme

USER PrivEscape
WORKDIR /home/PrivEscape

RUN echo "PATH=$HOME:bin" >> /home/PrivEscape/.bashrc
RUN echo "export PATH" >> /home/PrivEscape/.bashrc
RUN mkdir /home/PrivEscape/bin
RUN ln -s /bin/ls /home/PrivEscape/bin/
RUN ln -s /bin/gcc /home/PrivEscape/bin/
RUN ln -s /bin/man /home/PrivEscape/bin/
RUN ln -s /bin/cat /home/PrivEscape/bin/
RUN ln -s /usr/bin/sudo /home/PrivEscape/bin/
RUN ln -s /usr/bin/cancel /home/PrivEscape/bin/
RUN ln -s /usr/bin/awk /home/PrivEscape/bin/
RUN ln -s /usr/bin/cp /home/PrivEscape/bin/

COPY PrivEscape/escape /home/PrivEscape/bin/escape
COPY PrivEscape/wall.sh /bin/walle
COPY PrivEscape/timer.sh /bin/timer

USER root
RUN chmod 700 /home/PrivEscape/bin/escape

USER PrivEscape' > Dockerfile


docker build -t ctf .
sudo docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
docker exec -u 0 ctf /bin/timer escape &
docker exec -it ctf /bin/rbash