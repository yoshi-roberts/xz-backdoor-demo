FROM ubuntu:latest

# Update system and install packages.
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y software-properties-common

RUN apt update -y && apt install -y \
pkg-config apt-utils sudo bash zip unzip git golang-go

RUN go install github.com/amlweems/xzbot@latest
RUN echo "export PATH=$PATH:/root/go/bin" >> /root/.bashrc

ENTRYPOINT ["bash"]
