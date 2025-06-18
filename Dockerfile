FROM redis:7.0-alpine

# Creamos directorio para el ACL
RUN mkdir -p /etc/redis

# Copiamos el entrypoint personalizado
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Exponemos el puerto por defecto
EXPOSE 6379

# Usamos nuestro entrypoint y luego el comando por defecto
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server"]
