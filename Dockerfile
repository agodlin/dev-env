FROM ubuntu:16.04

#COPY apt.conf /etc/apt/apt.conf 
#ENV http_proxy=http://proxy-chain.intel.com:911/
#ENV https_proxy=https://proxy-chain.intel.com:912/

Copy emacs/.emacs /root/.emacs
Copy emacs/.emacs.d /root/.emacs.d

RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
        cmake \
        git \
        wget \
		nodejs \
		npm \
        python3-pip \
        python3-dev \
        emacs && \
    rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python \
	&& ln -s /usr/bin/nodejs /usr/bin/node \
    && pip3 install --upgrade pip \
    && pip install virtualenv django

RUN echo "export PS1='>'" | tee -a ~/.bashrc \ 
    && git config --global alias.co checkout \
    && git config --global alias.br branch \
    && git config --global alias.ci commit \
    && git config --global alias.st status \
    && git config --global alias.unstage 'reset HEAD --' \
    && git config --global alias.last 'log -1 HEAD'
	
EXPOSE 3000    
    
WORKDIR /workspace