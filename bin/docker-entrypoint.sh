#!/bin/sh

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake assets:precompile

export SECRET_KEY_BASE=$(bundle exec rake secret)

bundle exec foreman start web=1,worker=0
