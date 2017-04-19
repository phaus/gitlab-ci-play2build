FROM java:8
MAINTAINER Philipp Haußleiter <philipp@haussleiter.de>

RUN set -ex

RUN echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update -yq
RUN apt-get install sbt -y
RUN sbt sbt-version
