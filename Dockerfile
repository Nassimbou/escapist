
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install gcc
RUN apt-get -y install sudo

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/ProgEscape/ -m -p ProgEscape -s /bin/rbash ProgEscape
RUN chmod 755 /home/ProgEscape 

RUN echo "ProgEscape ALL=NOPASSWD: /home/ProgEscape/prog" >> /etc/sudoers

USER ProgEscape
WORKDIR /home/ProgEscape

RUN echo "PATH=$HOME:bin" >> /home/ProgEscape/.bashrc
RUN echo "export PATH" >> /home/ProgEscape/.bashrc
RUN mkdir /home/ProgEscape/bin
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

COPY ProgEscape/escape /home/ProgEscape/bin/escape
COPY ProgEscape/prog /home/ProgEscape/prog
COPY ProgEscape/wall.sh /bin/walle
COPY ProgEscape/timer.sh /bin/timer
COPY bashrc /home/ProgEscape/.bashrc

USER root
RUN chmod 700 /home/ProgEscape/bin/escape
RUN chmod 744 /home/ProgEscape/prog

USER ProgEscape
