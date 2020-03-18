#!/bin/bash

docker stop ctf
docker build -t ctf .
docker run --rm -v --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
docker exec -u 0 ctf /bin/timer escape &
docker exec -it ctf /bin/rbash
