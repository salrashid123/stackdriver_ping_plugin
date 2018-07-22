FROM debian:8

RUN apt-get update && \
    apt-get install -y git gcc build-essential flex bison autoconf automake libtool libltdl3-dev liboping-dev pkg-config

RUN git clone https://github.com/collectd/collectd.git

#ADD ping.c collectd/src/ping.c
RUN cd collectd && \
    ./build.sh && \
    ./configure --enable-ping && \
    make
