#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:latest

# Set TZ info
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget netcat dnsutils iputils-* && \
  apt-get install -y python3 python3-pip jq && \
  python3 -m pip install elasticsearch-curator && \
  rm -rf /var/lib/apt/lists/*


# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
