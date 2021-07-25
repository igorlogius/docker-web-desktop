FROM openjdk:8 

RUN useradd -ms /bin/bash cyber

RUN apt update -y && apt install --no-install-recommends -y x11vnc xvfb openbox xterm bash menu firefox-esr 
ADD https://github.com/pgaskin/easy-novnc/releases/download/v1.1.0/easy-novnc_linux-64bit /
RUN chmod +x easy-novnc_linux-64bit

# install some custom software here ... 

COPY startup.sh /startup.sh
RUN chmod 0755 /startup.sh 
RUN chown -R cyber:cyber /home/cyber

USER cyber
CMD /startup.sh
