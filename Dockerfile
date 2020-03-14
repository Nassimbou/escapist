FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -m escape -s /bin/rbash
RUN chmod 755 /home/escape 

USER escape
WORKDIR /home/escape

RUN echo "PATH=$HOME/bin" >> /home/escape/.bashrc
RUN echo "export PATH" >> /home/escape/.bashrc
RUN mkdir /home/escape/bin
RUN ln -s /bin/ls /home/escape/bin/
RUN ln -s /bin/cd /home/escape/bin/
RUN ln -s /bin/nice /home/escape/bin/

COPY escape.sh /home/escape/bin/

USER root
RUN chsh -s /bin/rbash escape

USER escape
