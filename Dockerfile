FROM python:3.7-alpine
MAINTAINER @jbeley
ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on
USER root

RUN apk add --no-cache ca-certificates zlib py-pillow py-crypto py-lxml py-setuptools libxslt-dev openssl
RUN apk add --no-cache -t .build-deps \
  openssl-dev \
  python-dev \
  build-base \
  zlib-dev \
  libc-dev \
  jpeg-dev \
  py-pip \
  mercurial \
  autoconf \
  automake \
  libtool \
  libmagic \
  git \
  flex \
  swig \
  && pip install --upgrade pip wheel \
  && git clone https://github.com/guelfoweb/peframe /tmp/peframe \
  && cd /tmp/peframe \
  && pip install -r requirements.txt

