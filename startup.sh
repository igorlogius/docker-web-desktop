#!/bin/sh
export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
openbox-session &
#x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
x11vnc -display :1 -shared -nopw -listen 0.0.0.0 -xkb -ncache 10 -ncache_cr -forever &
#cd /noVNC && ln -s vnc.html index.html && ./utils/launch.sh --vnc localhost:5900
#cd /noVNC && ln -s vnc.html index.html && ./utils/novnc_proxy --vnc localhost:5900 --listen 6080
cd / && ./easy-novnc_linux-64bit -u -a ":8080" -h localhost -p 5900 --novnc-params "resize=remote" 
