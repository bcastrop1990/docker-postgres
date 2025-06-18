# Usamos la imagen oficial de Redis Alpine
FROM redis:7.0-alpine

# Argumento para la contraseña
ARG REDIS_PASSWORD=TuContrasenaSecreta

# Creamos carpeta de configuración y generamos archivo ACL
RUN mkdir -p /usr/local/etc/redis \
 && printf "user default on >${REDIS_PASSWORD} ~* +@all\n" \
    > /usr/local/etc/redis/users.acl

# Exponemos el puerto por defecto de Redis
EXPOSE 6379

# Arrancamos Redis:
#  - cargando el ACL
#  - bindear a 0.0.0.0 (todas las interfaces)
#  - deshabilitar protected-mode (para aceptar conexiones externas)
CMD ["redis-server", \
     "--aclfile", "/usr/local/etc/redis/users.acl", \
     "--bind", "0.0.0.0", \
     "--protected-mode", "no"]
