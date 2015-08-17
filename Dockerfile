FROM ruby:2.2.2
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY vendor/bundle /usr/src/app/vendor/bundle
RUN bundle install --without test development --path=vendor/bundle

COPY . /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production

EXPOSE 5000
# ENTRYPOINT ["bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
