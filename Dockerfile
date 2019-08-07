FROM ruby:latest

MAINTAINER Sutou Kouhei <kou@clear-code.com>

RUN \
  apt update && \
  apt install -y \
    apt-transport-https \
    curl \
    gnupg \
    lsb-release && \
  curl \
    --output /usr/share/keyrings/apache-arrow-keyring.gpg \
    https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-keyring.gpg && \
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/apache-arrow-keyring.gpg] https://dl.bintray.com/apache/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/ $(lsb_release --codename --short) main" \
    > /etc/apt/sources.list.d/apache-arrow.list && \
  apt update && \
  apt install -y libarrow-glib-dev

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
