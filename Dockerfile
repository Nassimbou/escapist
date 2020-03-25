
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "root:toor" | chpasswd

RUN useradd -d /home/KindEscape/ -m -p KindEscape -s /bin/rbash KindEscape
RUN chmod 755 /home/KindEscape 

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

COPY KindEscape/escape /home/KindEscape/bin/escape
COPY KindEscape/wall.sh /bin/walle
COPY KindEscape/timer.sh /bin/timer
COPY bashrc /home/KindEscape/.bashrc
