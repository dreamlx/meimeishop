
FROM ruby:2.5.3
MAINTAINER dreamlinx <dreamlinx@gmail.com>

# ARG http_proxy=http://127.0.0.1:2222
# ARG https_proxy=http://127.0.0.1:2222
# RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim postgis imagemagick
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV RAILS_ENV development
ENV BUNDLER_VERSION=2.0.1
RUN gem update --system
RUN gem install bundler -v 2.0.1
RUN bundle install
COPY . /app
CMD rake db:migrate assets:precompile && puma -C config/puma.rb