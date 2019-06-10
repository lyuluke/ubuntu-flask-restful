FROM ubuntu:18.04
LABEL  maintainer="LK"

RUN \
#==================================================
# python3.6
#==================================================
  apt-get update &&\
  apt-get -qqy --no-install-recommends install \
    python3.6 \
    python3-pip &&\
  apt-get clean && rm -rf /var/lib/apt/lists/* &&\
 
#==================================================
# flask
#==================================================
  pip3 install flask &&\
  pip3 install flask-restful \
  

CMD ["/bin/bash"]
