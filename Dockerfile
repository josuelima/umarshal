FROM ruby:2.3.0-alpine
MAINTAINER Josue Lima <josuedsi@gmail.com>

RUN apk add --no-cache make g++

RUN gem install sinatra
RUN gem install thin
RUN gem install redis

EXPOSE 9000
