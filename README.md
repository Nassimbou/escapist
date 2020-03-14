# escapist

sudo docker stop ctf
sudo docker build -t ctf .
sudo docker run --rm -v --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
sudo docker run -t -i ctf
