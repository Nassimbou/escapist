# sudo docker build -t api .
# sudo docker run --init --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -p 8080:8080 -d --name api -i api
FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y curl

EXPOSE  8080
#CMD ["python3", "-m", "http.server", "8080"]

COPY api.py /usr/local/bin/
RUN ln -s /usr/local/bin/api.py /
RUN chmod +x api.py
