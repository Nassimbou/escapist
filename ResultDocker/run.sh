#!/bin/bash
sudo docker stop api
sudo docker build -t api .
sudo docker run --init --rm -v --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -p 8080:8080 -d --name api -i api
sudo docker exec -i api ./api.py &
