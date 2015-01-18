#!/bin/sh

bundle exec rake db:create
bundle exec rake db:migrate

bundle exec foreman start web=0,worker=1
