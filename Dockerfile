# Dockerfile
FROM redis:7.0-alpine

# 1) Define un argumento de build para la contraseña
ARG REDIS_PASSWORD=TuContrasenaSecreta
ENV REDIS_PASSWORD=${REDIS_PASSWORD}

# 2) Crea un pequeño redis.conf con la directiva requirepass
RUN mkdir -p /usr/local/etc/redis \
 && printf "requirepass ${REDIS_PASSWORD}\n" > /usr/local/etc/redis/redis.conf

# 3) Expone el puerto por defecto
EXPOSE 6379

# 4) Arranca Redis usando nuestra configuración
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
