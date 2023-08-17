ARG VERSION=2022-latest
FROM mcr.microsoft.com/mssql/server:${VERSION}

USER root

ARG UBUNTU=20.04
ARG YEAR=2022
RUN apt-get update && \
  apt-get install -y apt-transport-https software-properties-common && \
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc && \
  add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/${UBUNTU}/mssql-server-${YEAR}.list)" && \
  apt-get update && \
  apt-get install -y mssql-server-fts && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER 10001
