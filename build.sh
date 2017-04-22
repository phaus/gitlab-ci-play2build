#!/bin/bash

set -ex

echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update -yq
apt-get install sbt rubygems ruby-dev docker.io -y
gem install dpl

env
docker
sbt sbt-version
sbt compile
