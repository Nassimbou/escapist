
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

#RUN sed -i "s,^path-exclude=/usr/share/man/,#path-exclude=/usr/share/man/," /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get update
#RUN apt-get -y install man
#RUN apt-get -y install manpages-posix
RUN apt-get -y install nano
RUN apt-get -y install sudo
RUN apt-get -y install gcc

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/PrivEscape/ -m -p PrivEscape -s /bin/rbash PrivEscape
RUN chmod 755 /home/PrivEscape 

RUN echo "PrivEscape ALL=NOPASSWD: /usr/bin/nano" >> /etc/sudoers
RUN echo "#PrivEscape ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
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
RUN ln -s /usr/bin/nice /home/PrivEscape/bin/

COPY PrivEscape/escape /home/PrivEscape/bin/escape
COPY PrivEscape/wall.sh /bin/walle
COPY PrivEscape/timer.sh /bin/timer
COPY bashrc /home/PrivEscape/.bashrc

USER root
RUN chmod 700 /home/PrivEscape/bin/escape

USER PrivEscape
