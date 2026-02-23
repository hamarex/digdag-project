#!/bin/bash
set -e

export PGPASSWORD=${POSTGRES_PASSWORD}

echo "Waiting for PostgreSQL to be ready..."
until psql -h postgres -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c "SELECT 1" > /dev/null 2>&1; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 2
done

echo "PostgreSQL is ready!"

# 環境変数を展開したserver.propertiesを生成
envsubst < /digdag/server.properties > /digdag/server.properties.tmp
mv /digdag/server.properties.tmp /digdag/server.properties

echo "Starting digdag server..."
exec digdag server -c /digdag/server.properties
