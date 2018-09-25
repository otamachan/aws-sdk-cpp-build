FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y \
       build-essential autoconf libtool pkg-config \
       cmake \
       checkinstall \
       git \
       zlib1g-dev libssl-dev libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*
ADD build.sh /root
ADD Makefile /root
WORKDIR /root
CMD ["/root/build.sh"]