FROM postgres:12.9

ADD ./docker_postgres_init.sql /docker-entrypoint-initdb.d

RUN chown postgres:postgres /docker-entrypoint-initdb.d/*.sql

