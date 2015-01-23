FROM quay.io/dtan4/ramesh-dashboard:latest
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

COPY docker-entrypoint.sh /usr/src/app/bin/docker-entrypoint.sh
ENV RAILS_ENV production

ENTRYPOINT ["bin/docker-entrypoint.sh"]
