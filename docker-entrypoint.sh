#!/usr/bin/env sh
set -e

# Si se define REDIS_PASSWORD, generamos el ACL para el usuario 'default'
if [ -n "$REDIS_PASSWORD" ]; then
  printf "user default on >%s ~* +@all\n" "$REDIS_PASSWORD" \
    > /etc/redis/users.acl
  # Añadimos la opción para que Redis cargue ese ACL
  set -- "$@" --aclfile /etc/redis/users.acl
fi

# Ejecutamos el comando original (redis-server) con posibles flags extra
exec "$@"
