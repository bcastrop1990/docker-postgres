# Usa la imagen oficial de Postgres
FROM postgres:17

# Variables por defecto (puedes sobreescribirlas en Render)
ENV POSTGRES_USER=test
ENV POSTGRES_PASSWORD=Plani11as
ENV POSTGRES_DB=test

# (Opcional) Copia scripts de inicialización
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expon el puerto que Render usará para health checks
EXPOSE 5432

# Healthcheck: verifica con pg_isready via TCP/Unix socket
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s \
  CMD pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1
