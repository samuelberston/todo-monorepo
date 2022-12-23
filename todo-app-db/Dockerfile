FROM postgres:15.1
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB TODO
COPY schema.sql /docker-entrypoint-initdb.d/
RUN service postgresql start
USER postgres
RUN initdb