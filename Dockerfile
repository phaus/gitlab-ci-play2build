FROM openjdk:8

MAINTAINER Philipp Haußleiter <philipp@haussleiter.de>

ADD project/build.properties project/

RUN echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update -yq
RUN apt-get install -y \
	apt-utils \
	sbt \ 
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update -yq

RUN apt-get install -y docker-ce 

RUN apt-get clean

RUN apt-get install -y rubygems ruby-dev && gem install dpl
