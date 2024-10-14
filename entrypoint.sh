#!/bin/bash
set -e

# Eliminar un posible PID antiguo
rm -f /myapp/tmp/pids/server.pid

# Ejecutar migraciones pendientes (opcional para producción)
if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails db:migrate
fi

# Ejecutar el comando del contenedor
exec "$@"
