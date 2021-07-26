
# Requirements 

1. docker (tested with 18.09.01)
3. bash (>= 3.x.x)
2. clone/download this repository

# Setup/Configuration

Change the values in `env.sh` to fit your needs

# Build the docker image

```sh
./build.sh
```

# run the docker image (foreground)

```sh
./run.sh
```

# run the docker image (background)

add the `-d` switch to the docker command in the `run.sh` script

# How it works / What is used

Dockerfile creates a docker image containing a  
* minimal desktop environment (openbox) 
* framebuffer based Xserver (xvfb)
* easy-novnc (vnc-to-http proxy)

When a container is started it lauches the `startup.sh` which starts 
1. xvfb (creates a "virtual" xserver) 
1. x11vnc (starts a vnc server which connectes to the X session)
1. easy-novnc connects to x11vnc and setup a http proxy to access the xserver session via web interface

# Add custom software

To add custom software/application one can either modify the `Dockerfile` and bake the applications into the container, 
or manually install the software when the container is running.

# Persistent Storage / Workspace 

To establish a persistent storage one can either mount a network attached storage into the container or setup second container to provide a storage location which is independent from the application files. 


# Any Questions ? 
Open an issue, i'll try to answer to the best of my abilities.
