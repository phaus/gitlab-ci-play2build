FROM java:8
MAINTAINER Philipp Haußleiter <philipp@haussleiter.de>

ADD build.sh build.sh
ADD project/build.properties project/
RUN chmod +x build.sh && ./build.sh