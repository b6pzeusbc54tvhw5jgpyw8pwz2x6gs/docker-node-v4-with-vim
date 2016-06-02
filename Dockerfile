FROM node:4.4.5
MAINTAINER Alfred UC b6pzeusbc54tvhw5jgpyw8pwz2x6gs@gmail.com

RUN apt-get update \
 && apt-get install -y -q python2.7-dev zip \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* \
 && cd ~ \
 && git clone https://github.com/vim/vim.git \
 && cd vim \
 && ./configure --enable-pythoninterp --with-python-config-dir=$(python2.7-config --configdir) \
 && make \
 && make install \
 && cp /usr/local/bin/vim /usr/local/bin/vi
 && rm -rf ~/vim
