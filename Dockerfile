# Pull base image.
FROM ubuntu:20.04
MAINTAINER Thibault Payet "mailoo.org"

ENV DEBIAN_FRONTEND=noninteractive

# Install.
RUN apt-get update -q -y

RUN apt-get install -qq -y apt-utils
RUN apt-get install -qq -y cmake
RUN apt-get install -q -y git
RUN apt-get install -qq -y ninja-build
RUN apt-get install -qq -y build-essential
RUN apt-get install -qq -y libglm-dev
RUN apt-get install -qq -y clang
RUN apt-get install -qq -y meson
RUN apt-get install -q -y pkg-config
RUN apt-get install -q -y doxygen
RUN apt-get install -q -y graphviz
RUN apt-get install -q -y libsdl2-dev
RUN apt-get install -q -y libsdl2-image-dev
RUN apt-get install -q -y libassimp-dev
RUN apt-get install -q -y xvfb
RUN apt-get install -q -y libgl1-mesa-dev
RUN apt-get install -q -y libgl1-mesa-glx
RUN apt-get install -q -y libgl1-mesa-dri
RUN apt-get install -q -y libegl1-mesa-dev
RUN apt-get install -q -y libgles2-mesa-dev
RUN apt-get install -q -y libbullet-dev
RUN apt-get install -q -y gcovr
RUN apt-get install -q -y libepoxy-dev

# hpx require
RUN apt-get install -q -y libboost-all-dev
RUN apt-get install -q -y hwloc
RUN apt-get install -q -y libhwloc-dev

RUN git clone https://github.com/STEllAR-GROUP/hpx && \
cd hpx && git checkout 1.3.0 && cd .. && \
mkdir build-hpx && cd build-hpx && \
cmake ../hpx -GNinja -DHPX_WITH_MALLOC=system && \
ninja && \
ninja install && \
cd ..
