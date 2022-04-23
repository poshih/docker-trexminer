FROM nvidia/cuda:11.2.0-devel-ubuntu20.04

LABEL wwwwww <wwww@wwww.io>

WORKDIR /root

RUN apt update
RUN apt -y install wget 
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz

RUN tar -xzf t-rex-0.25.12-linux.tar.gz

ENV ETH_ADDRESS=0xD1D1419EDE629923cCe568b4040Dde13C132acc1
ENV SERVER=us1.ethermine.org
ENV WORKER_NAME=worker0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD startup.sh /root/onstart.sh
RUN chmod +x /root/onstart.sh
#ENTRYPOINT /entrypoint.sh
