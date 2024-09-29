FROM postgres:15.1
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB todo
EXPOSE 5432
COPY schema.sql /docker-entrypoint-initdb.d/
