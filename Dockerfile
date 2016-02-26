# Run with:
# docker run -d --name unmarshal -p 9000:9000 -v "$PWD"/configs:/usr/src/app/configs josuelima/unmarshal:latest
FROM ruby:2.3.0-alpine
MAINTAINER Josue Lima <josuedsi@gmail.com>

RUN apk add --no-cache make g++
WORKDIR /usr/src/app

# At this point you must have the app cloned on your current local folder
# http://github.com/josuelima/unmarshal
ADD ./ /usr/src/app
RUN bundle install

EXPOSE 9000

CMD ["ruby", "app.rb"]
