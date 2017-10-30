FROM ubuntu:14.04.5
MAINTAINER Alfred UC b6pzeusbc54tvhw5jgpyw8pwz2x6gs@gmail.com

# Install vim-nox, python, zip
RUN apt-get update \
 && apt-get install -y software-properties-common

RUN add-apt-repository ppa:jonathonf/vim -y \
 && apt-get update \
 && apt-get install wget curl vim-nox python2.7-dev zip -yq
 
# Install latest version of pip
RUN curl -sL https://bootstrap.pypa.io/get-pip.py | python3 -

# Install AWS CLI
RUN pip install awscli docker-compose

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - \
 && sudo apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# cleaning
RUN apt-get clean \
 && rm -r /var/lib/apt/lists/* \
