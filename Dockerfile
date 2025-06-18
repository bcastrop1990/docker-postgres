# 1. Partimos de la imagen oficial de Redis (Alpine)
FROM redis:7.0-alpine

# 2. Definimos el ARG con un valor por defecto que podrás sobreescribir al construir
ARG REDIS_PASSWORD=TuPassSecreta

# 3. Creamos la carpeta de configuración y generamos el redis.conf:
#    - bind 0.0.0.0 permite conexiones desde cualquier IP
#    - requirepass establece la contraseña
RUN mkdir -p /usr/local/etc/redis \
    && printf "bind 0.0.0.0\nrequirepass %s\n" "${REDIS_PASSWORD}" \
       > /usr/local/etc/redis/redis.conf

# 4. Exponemos el puerto estándar
EXPOSE 6379

# 5. Arrancamos Redis usando nuestro redis.conf
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
