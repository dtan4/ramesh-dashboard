FROM dtan4/ramesh-dashboard:latest

COPY docker-entrypoint.sh /usr/src/app/bin/docker-entrypoint.sh
ENV RAILS_ENV production

ENTRYPOINT ["bin/docker-entrypoint.sh"]
