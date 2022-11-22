FROM ruby:3.1.0

ENV DB_HOST=db
ENV DB_NAME=scheduler
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=123456

RUN apt-get update -qq && apt-get install -y nodejs npm yarn postgresql-client libpq-dev

WORKDIR /usr/src/app

COPY Gemfile* /app/

COPY . .
RUN gem install bundler

RUN bundle install

RUN bundle binstubs --all
