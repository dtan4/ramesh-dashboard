FROM dtan4/ramesh-dashboard

COPY docker-entrypoint.sh /usr/src/app/bin/docker-entrypoint.sh
ENV RAILS_ENV production

EXPOSE 5000
ENTRYPOINT ["bin/docker-entrypoint.sh"]
