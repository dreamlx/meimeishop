FROM ubuntu:18.04

# 基于镜像 ruby 2.2.0
FROM ruby:2.5.3
# 安装所需的库和依赖
RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
# 设置 Rails 版本
ENV RAILS_VERSION Rails 5.2.4.4
# 安装 Rails
RUN gem install rails --version "$RAILS_VERSION"
# 创建代码所运行的目录

RUN apt-get update && apt-get install -y curl apt-transport-https && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  ruby \
  ruby-dev \
  tzdata \
  yarn \
  zlib1g-dev

WORKDIR /app

RUN gem install bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

# 运行 rake 任务
RUN RAILS_ENV=production rake db:create db:migrate