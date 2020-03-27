#!/bin/bash

docker stop ctf
echo '
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install gcc
RUN apt-get -y install sudo
RUN apt-get -y install make
RUN apt-get -y install rsync

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/IDEscape/ -m -p IDEscape -s /bin/rbash IDEscape
RUN chmod 755 /home/IDEscape 

RUN echo "IDEscape ALL=NOPASSWD: who" >> /etc/sudoers

USER IDEscape
WORKDIR /home/IDEscape

RUN echo "PATH=$HOME:bin" >> /home/IDEscape/.bashrc
RUN echo "export PATH" >> /home/IDEscape/.bashrc
RUN mkdir /home/IDEscape/bin
RUN mkdir /home/IDEscape/man
RUN ln -s /bin/ls /home/IDEscape/bin/
RUN ln -s /usr/bin/cancel /home/IDEscape/bin/
RUN ln -s /usr/bin/cp /home/IDEscape/bin/
RUN ln -s /usr/bin/base64 /home/IDEscape/bin/
RUN ln -s /usr/bin/nano /home/IDEscape/bin/
RUN ln -s /usr/bin/who /home/IDEscape/bin/
RUN ln -s /usr/bin/sudo /home/IDEscape/bin/
RUN ln -s /usr/bin/nice /home/IDEscape/bin/
RUN ln -s /usr/bin/make /home/IDEscape/bin/
RUN ln -s /usr/bin/chmod /home/IDEscape/bin/
RUN ln -s /bin/gcc /home/IDEscape/bin/
RUN ln -s /bin/man /home/IDEscape/bin/
RUN ln -s /bin/cat /home/IDEscape/bin/
RUN ln -s /usr/bin/rsync /home/IDEscape/bin/rsync

COPY IDEscape/escape /home/IDEscape/bin/escape
COPY IDEscape/wall.sh /bin/walle
COPY IDEscape/timer.sh /bin/timer
COPY bashrc /home/IDEscape/.bashrc

COPY IDEscape/man/base64 /home/IDEscape/man
COPY IDEscape/man/cancel /home/IDEscape/man
COPY IDEscape/man/cat /home/IDEscape/man
COPY IDEscape/man/chmod /home/IDEscape/man
COPY IDEscape/man/cp /home/IDEscape/man
COPY IDEscape/man/gcc /home/IDEscape/man
COPY IDEscape/man/make /home/IDEscape/man
COPY IDEscape/man/nano /home/IDEscape/man
COPY IDEscape/man/nice /home/IDEscape/man
COPY IDEscape/man/rsync /home/IDEscape/man
COPY IDEscape/man/who /home/IDEscape/man
COPY IDEscape/man/eval /home/IDEscape/man

USER root
RUN chmod 700 /home/IDEscape/bin/escape
RUN chmod u+s /home/IDEscape/bin/make

USER IDEscape' > Dockerfile


docker build -t ctf .
clear
sudo docker run --init --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
docker exec -u 0 ctf /bin/timer escape &
docker exec -it ctf /bin/rbash
