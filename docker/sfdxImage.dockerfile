FROM ubuntu:18.04

ENV SFDX_AUTOUPDATE_DISABLE=true

RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  ca-certificates \
  jq \
  bc \
  git \
  python \
  xmlstarlet \
  sudo \
  curl \
 openjdk-11-jre-headless \
  && rm -rf /var/lib/apt/lists/*

#nodeJS last stable version
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN apt-get install -y nodejs

#Install sfdx latest version with npm
RUN npm install sfdx-cli --global
RUN sfdx --version


RUN groupadd --gid 1000 jenkins \
   && useradd --uid 1000 --gid jenkins --shell /bin/bash --create-home jenkins
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

USER jenkins
RUN whoami

RUN echo "y" | sfdx plugins:install sfpowerkit
RUN echo "y" | sfdx plugins:install sfdx-git-delta
RUN sfdx plugins:install @salesforce/sfdx-scanner


USER root
WORKDIR home/jenkins