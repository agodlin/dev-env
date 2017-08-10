FROM ubuntu:16.04

COPY apt.conf /etc/apt/apt.conf 
ENV http_proxy=http://proxy-chain.intel.com:911/
ENV https_proxy=https://proxy-chain.intel.com:912/

RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
        cmake \
        git \
        wget \
        python3-pip \
        python3-dev \
        emacs && \
    rm -rf /var/lib/apt/lists/* \
    && cd /usr/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip \
    && pip install virtualenv

Copy emacs/.emacs /root/.emacs
Copy emacs/.emacs.d /root/.emacs.d
    
#RUN mkdir ~/.emacs.d/plugins && cd ~/.emacs.d/plugins && git clone --recursive https://github.com/joaotavora/yasnippet

EXPOSE 8000

#RUN pip --no-cache-dir install django faker

WORKDIR /workspace