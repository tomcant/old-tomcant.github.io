FROM ruby:2.7.2

EXPOSE 4000

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

CMD bundle exec jekyll serve --host 0.0.0.0
