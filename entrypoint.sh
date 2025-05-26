#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

# Wait for database to be ready
until pg_isready -h db -U postgres; do
  echo "Waiting for database to be ready..."
  sleep 2
done

# Setup database if needed
if [ "${RAILS_ENV}" = "development" ]; then
  bundle exec rails db:prepare
fi

# Then exec the container's main process
exec "$@" 
