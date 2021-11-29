FROM postgres
#création BDD
ENV POSTGRES_DB postgres 
#connection
ENV POSTGRES_PASSWORD docker

#modification du role
COPY create_role_olivierx.sql /docker-entrypoint-initdb.d/

#Dump
COPY perso_db_28_11_2021.sql /docker-entrypoint-initdb.d/
RUN chown postgres:postgres /docker-entrypoint-initdb.d/*.sql

