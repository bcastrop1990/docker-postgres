# Dockerfile
# 1. Partimos de la imagen oficial de Redis Alpine
FROM redis:7.0-alpine

# 2. Definimos un ARG que podrás inyectar desde Render (en Settings → Environment)
ARG REDIS_PASSWORD

# 3. Creamos un fichero de configuración mínimo con requirepass
RUN mkdir -p /usr/local/etc/redis \
 && printf "requirepass ${REDIS_PASSWORD}\n" > /usr/local/etc/redis/redis.conf

# 4. Exponemos el puerto estándar de Redis
EXPOSE 6379

# 5. Arrancamos Redis usando nuestro fichero de configuración
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
