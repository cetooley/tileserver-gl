FROM node:10
MAINTAINER Chris Tooley <ctooley@foundryspatial.com>

ENV NODE_ENV="production"
VOLUME /data
WORKDIR /data
EXPOSE 80
ENTRYPOINT ["/bin/bash", "/usr/src/app/run.sh"]

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https \
    curl \
    unzip \
    build-essential \
    python \
    libcairo2-dev \
    libgles2-mesa-dev \
    libgbm-dev \
    libllvm3.9 \
    libprotobuf-dev \
    libxxf86vm-dev \
    xvfb \
    x11-utils \
&& apt-get clean

RUN mkdir -p /usr/src/app
COPY / /usr/src/app
RUN cd /usr/src/app && npm install --production
