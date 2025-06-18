# Usamos la imagen oficial de Redis Alpine
FROM redis:7.0-alpine

# Nombre de argumento para inyectar la contraseña en tiempo de build (puedes cambiarla al construir)
ARG REDIS_PASSWORD=TuContrasenaSecreta

# Creamos carpeta de configuración y generamos el archivo ACL
RUN mkdir -p /usr/local/etc/redis \
 && printf "user default on >${REDIS_PASSWORD} ~* +@all\n" > /usr/local/etc/redis/users.acl

# Exponemos el puerto por defecto de Redis
EXPOSE 6379

# Arrancamos Redis indicando el archivo de ACL que fija la contraseña del user 'default'
CMD ["redis-server", "--aclfile", "/usr/local/etc/redis/users.acl"]
