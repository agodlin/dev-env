FROM ubuntu:16.04

COPY apt.conf /etc/apt/apt.conf 
ENV http_proxy=http://proxy-chain.intel.com:911/
ENV https_proxy=https://proxy-chain.intel.com:912/

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        emacs && \
    rm -rf /var/lib/apt/lists/*
    
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 && rm -rf /var/lib/apt/lists/*
    
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN mkdir ~/.emacs.d && mkdir ~/.emacs.d/plugins && cd ~/.emacs.d/plugins && git clone --recursive https://github.com/joaotavora/yasnippet

EXPOSE 8000

RUN pip --no-cache-dir install \
        django \
        faker

WORKDIR /workspace