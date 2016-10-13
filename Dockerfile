FROM node:4.6
MAINTAINER Alfred UC b6pzeusbc54tvhw5jgpyw8pwz2x6gs@gmail.com

# Install vim-nox, python, zip
RUN add-apt-repository ppa:jonathonf/vim -y \
 && apt-get update \
 && apt-get install vim-nox python2.7-dev zip -yq

# Install latest version of pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Install AWS CLI
RUN pip install awscli awsebcli

# Install yarn
RUN npm install yarn -g

# cleaning
RUN apt-get clean \
 && rm -r /var/lib/apt/lists/* \
