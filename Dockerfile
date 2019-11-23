FROM ubuntu:18.04
LABEL  maintainer="LK"
COPY AutoSSH /usr/bin/AutoSSH
ENV DEBIAN_FRONTEND noninteractive
RUN \
#==================================================
# Executable
#==================================================
  chmod 777 /usr/bin/AutoSSH &&\
#==================================================
# Work space
#==================================================
  #mkdir /code &&\
#==================================================
# Ubuntu chinese source
#==================================================
  #sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
  #sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
#==================================================
# Python3.6
#==================================================
  apt-get update &&\
  apt-get -qqy --no-install-recommends install \
    python3.6 \
    python3-pip \
    python3-setuptools \
    python3-numpy \
    python3-pandas \
    curl \
    git \
    supervisor \
    libltdl-dev \
    postgresql \
    python-psycopg2 \ 
    libpq-dev &&\
#==================================================
# Flask
#==================================================
  #pip3 install flask &&\
  #pip3 install flask-restful &&\
  pip3 --no-cache-dir install wheel &&\
  pip3 --no-cache-dir install flask_restplus &&\
  pip3 --no-cache-dir install requests &&\
  pip3 --no-cache-dir install SQLAlchemy &&\
  pip3 --no-cache-dir install psycopg2 &&\
  pip3 --no-cache-dir install requests &&\
#==================================================
# apt clean
#==================================================
  apt-get clean && rm -rf /var/lib/apt/lists/* \
