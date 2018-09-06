FROM openjdk:jdk-alpine

LABEL maintainer="Philipp Haußleiter <philipp@haussleiter.de>"

ENV SBT_VERSION 0.13.11 
ENV SBT_HOME /usr/local/sbt 
ENV PATH ${PATH}:${SBT_HOME}/bin 
# Install sbt 
RUN apk add --update curl ca-certificates bash ttf-dejavu=2.37-r0 docker ruby ruby-irb ruby-rdoc ruby-dev git util-linux && \
    curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built && \
    rm -rf /var/cache/apk/*
RUN gem install dpl --no-rdoc --no-ri && \ 
    gem cleanup