FROM openjdk:8 
# based on debian 

RUN useradd -ms /bin/bash cyber

RUN apt update -y && apt install --no-install-recommends -y x11vnc xvfb openbox xterm bash python3 python3-numpy menu firefox-esr python3-xdg

ADD https://github.com/novnc/noVNC/archive/master.zip /
RUN unzip master.zip 
RUN mv noVNC-master noVNC 
RUN rm master.zip

# not needed anymore since novnc_proxy now auto downloads websockify 
#ADD https://github.com/noVNC/websockify/archive/master.zip /
#RUN unzip master.zip
#RUN mv websockify-master /noVNC/utils/websockify
#RUN rm master.zip

COPY startup.sh /startup.sh

# install some custom software here ... 
#ADD https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2.7.0_Linux.tar.gz /home/cyber/
#RUN cd /home/cyber && tar xvf ZAP_2.7.0_Linux.tar.gz && rm -f ZAP_2.7.0_Linux.tar.gz 

RUN chmod 0755 /startup.sh 
RUN chown -R cyber:cyber /home/cyber
RUN chown -R cyber:cyber /noVNC

USER cyber
CMD /startup.sh
