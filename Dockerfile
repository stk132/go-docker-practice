FROM my-postgres-base:latest

ENV LC_ALL ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_COLLATE ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV POSTGRES_INITDB_ARGS "--locale=ja_JP.UTF-8"
ADD ./createuser.sh /docker-entrypoint-initdb.d
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
