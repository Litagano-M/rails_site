FROM ruby:2.4.0

# Installing NodeJS for some Ruby gems needed by Rails
RUN apt-get update && apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /app/box

COPY . /app

RUN bundle install
RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]