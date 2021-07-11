FROM ruby:latest

MAINTAINER Sutou Kouhei <kou@clear-code.com>

RUN \
  apt update && \
  apt install -y \
    ca-certificates \
    lsb-release \
    wget && \
  wget \
    https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
  apt install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
  apt update && \
  apt install -y libarrow-glib-dev

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
