FROM ruby:3.1-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl build-essential libpq-dev && \
  curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y nodejs yarn


WORKDIR /usr/src/tempnotes

COPY . .

RUN gem install rails bundler

RUN bundle install
