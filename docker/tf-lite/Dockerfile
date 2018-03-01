FROM tensorflow/tensorflow:1.5.0-devel-gpu-py3

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        emacs && \
    rm -rf /var/lib/apt/lists/*

RUN cd ~/ && \
    git init . && \
    git remote add origin https://github.com/agodlin/dev-env.git && \
    git pull origin master

RUN echo "export PS1='>'" | tee -a ~/.bashrc \ 
    && git config --global alias.co checkout \
    && git config --global alias.br branch \
    && git config --global alias.ci commit \
    && git config --global alias.st status \
    && git config --global alias.unstage 'reset HEAD --' \
    && git config --global alias.last 'log -1 HEAD'

RUN curl 'https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip' > /tmp/studio.zip && unzip -d /opt /tmp/studio.zip && rm /tmp/studio.zip

RUN apt-get update && apt-get install -y --no-install-recommends \
    x11-apps \
    openjdk-8-jdk


RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /root/ && \
    chown ${uid}:${gid} -R /tensorflow && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

CMD /opt/android-studio/bin/studio.sh
