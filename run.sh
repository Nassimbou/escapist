#!/bin/bash

docker stop ctf
docker build -t ctf .
docker run --rm -v --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
docker exec -it ctf /bin/rbash
