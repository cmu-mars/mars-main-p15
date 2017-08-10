# The base Dockerfile used by all of the (executable) components of the Phase
# 1.5 implementation of MARS.
FROM ros:kinetic

# create a "mars" user with sudo privileges
# TODO: add tidying commands to shrink image size
RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -ms /bin/bash mars && \
    usermod -a -G sudo mars && \
    sed -i "s/(ALL:ALL) ALL/(ALL) NOPASSWD: ALL/" "/etc/sudoers" && \
    mkdir -p /home/mars
USER mars
WORKDIR /home/mars

RUN git config --global url.https://github.com/.insteadOf git://github.com/

# create an empty catkin workspace
RUN . /opt/ros/kinetic/setup.sh && \
    mkdir -p catkin_ws/src && \
    cd catkin_ws && \
    catkin_make
WORKDIR /home/mars/catkin_ws

# install some basic utilities
RUN sudo apt-get update && \
    sudo apt-get install -y vim wget curl

# install Kobuki (does this really belong here?)
RUN sudo apt-get install -y ros-kinetic-kobuki ros-kinetic-kobuki-core