FROM ubuntu:focal

RUN apt-get update
RUN apt-get install -y curl wget
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

WORKDIR /home/app

RUN wget https://dist.ipfs.tech/kubo/v0.26.0/kubo_v0.26.0_linux-amd64.tar.gz
RUN tar -xvzf kubo_v0.26.0_linux-amd64.tar.gz
RUN cd kubo
RUN bash kubo/install.sh

RUN apt-get install git -y

COPY main.sh main.sh
COPY index.js index.js
COPY package*.json .

RUN npm install

RUN chmod +x main.sh
RUN chmod +x index.js


ENTRYPOINT [ "/home/app/main.sh" ]