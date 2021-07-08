FROM ubuntu:18.04
LABEL description="Container to build Qt for Android"
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/^# deb-src/deb-src/g' /etc/apt/sources.list
RUN apt update
RUN apt -y dist-upgrade
RUN apt install -y git build-essential cmake openjdk-11-jdk-headless
RUN apt-get build-dep -y qtbase5-dev
RUN apt install -y libglew-dev lsb-release
#RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# RUN apt install -y vim apt-file
# RUN apt-file update
