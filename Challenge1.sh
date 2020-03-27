#!/bin/bash

docker stop ctf
echo '
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/KindEscape/ -m -p KindEscape -s /bin/rbash KindEscape
RUN chmod 755 /home/KindEscape 
RUN echo "This is an important message" > /home/KindEscape/readme
RUN echo "." > /home/KindEscape/escape

USER KindEscape
WORKDIR /home/KindEscape

RUN echo "PATH=$HOME:bin" >> /home/KindEscape/.bashrc
RUN echo "export PATH" >> /home/KindEscape/.bashrc
RUN mkdir /home/KindEscape/bin
RUN mkdir /home/KindEscape/nib
RUN mkdir /home/KindEscape/inb
RUN ln -s /bin/ls /home/KindEscape/bin/
RUN ln -s /bin/nice /home/KindEscape/bin/
RUN ln -s /bin/man /home/KindEscape/bin/
RUN ln -s /bin/cat /home/KindEscape/bin/
RUN ln -s /bin/echo /home/KindEscape/bin/
RUN ln -s /bin/grep /home/KindEscape/bin/
RUN ln -s /bin/wc /home/KindEscape/bin/
RUN ln -s /bin/dpkg /home/KindEscape/bin/
RUN ln -s /bin/cp /home/KindEscape/bin/

RUN ln -s /usr/bin/ls /home/KindEscape/nib/python
RUN ln -s /usr/bin/ls /home/KindEscape/nib/perl
RUN ln -s /usr/bin/ls /home/KindEscape/nib/lua

COPY KindEscape/escape /home/KindEscape/bin/escape
COPY KindEscape/wall.sh /bin/walle
COPY KindEscape/timer.sh /bin/timer
COPY bashrc /home/KindEscape/.bashrc' > Dockerfile

docker build -t ctf .
sudo docker run --init --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
clear
docker exec -u 0 ctf /bin/timer escape &
docker exec -it ctf /bin/rbash
