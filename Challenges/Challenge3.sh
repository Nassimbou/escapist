#!/bin/bash

docker stop ctf
echo '
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install libcurl4-gnutls-dev
RUN apt-get -y install curl
RUN apt-get -y install nano
RUN apt-get -y install gcc
RUN apt-get -y install sudo

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/ProgEscape/ -m -p ProgEscape -s /bin/rbash ProgEscape
RUN chmod 755 /home/ProgEscape 

RUN echo "ProgEscape ALL=NOPASSWD: /home/ProgEscape/prog" >> /etc/sudoers

RUN echo "This is an important message" > /home/ProgEscape/readme
RUN echo "" > /home/ProgEscape/escape
RUN echo "" > /home/ProgEscape/python

USER ProgEscape
WORKDIR /home/ProgEscape

RUN echo "PATH=$HOME:bin" >> /home/ProgEscape/.bashrc
RUN echo "export PATH" >> /home/ProgEscape/.bashrc
RUN mkdir /home/ProgEscape/bin
RUN mkdir /home/ProgEscape/man
RUN mkdir /home/ProgEscape/nib
RUN ln -s /bin/ls /home/ProgEscape/bin/
RUN ln -s /bin/gcc /home/ProgEscape/bin/
RUN ln -s /bin/man /home/ProgEscape/bin/
RUN ln -s /bin/cat /home/ProgEscape/bin/
RUN ln -s /usr/bin/cancel /home/ProgEscape/bin/
RUN ln -s /usr/bin/cp /home/ProgEscape/bin/
RUN ln -s /usr/bin/base64 /home/ProgEscape/bin/
RUN ln -s /usr/bin/chmod /home/ProgEscape/bin/
RUN ln -s /usr/bin/nano /home/ProgEscape/bin/
RUN ln -s /usr/bin/who /home/ProgEscape/bin/
RUN ln -s /usr/bin/sudo /home/ProgEscape/bin/
RUN ln -s /usr/bin/nice /home/ProgEscape/bin/

COPY ProgEscape/escape /home/ProgEscape/bin/escape
COPY ProgEscape/prog /home/ProgEscape/prog
COPY ProgEscape/wall.sh /bin/walle
COPY ProgEscape/timer.sh /bin/timer
COPY bashrc /home/ProgEscape/.bashrc

RUN ln -s /usr/bin/ls /home/ProgEscape/nib/python
RUN ln -s /usr/bin/ls /home/ProgEscape/nib/perl
RUN ln -s /usr/bin/ls /home/ProgEscape/nib/lua

COPY ProgEscape/man/base64 /home/ProgEscape/man
COPY ProgEscape/man/cancel /home/ProgEscape/man
COPY ProgEscape/man/cat /home/ProgEscape/man
COPY ProgEscape/man/chmod /home/ProgEscape/man
COPY ProgEscape/man/cp /home/ProgEscape/man
COPY ProgEscape/man/gcc /home/ProgEscape/man
COPY ProgEscape/man/nano /home/ProgEscape/man
COPY ProgEscape/man/nice /home/ProgEscape/man
COPY ProgEscape/man/who /home/ProgEscape/man
#COPY ProgEscape/man/C /home/ProgEscape/man
COPY start /bin/start
COPY end /home/ProgEscape/bin/escape

USER root
RUN chmod 700 /home/ProgEscape/bin/escape
RUN chmod 744 /home/ProgEscape/prog
RUN chmod u+s /home/ProgEscape/bin/escape

USER ProgEscape' > Dockerfile


docker build -t ctf .
docker run --init --rm -v --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf --link api -i ctf 
clear
docker exec -u 0 ctf /bin/start &
docker exec -u 0 ctf /bin/timer escape &
docker exec -it ctf /bin/rbash
