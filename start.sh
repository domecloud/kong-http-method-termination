#!/bin/bash

# "Starting kong-database..."
docker-compose up -d kong-database

STATUS="starting"

while [ "$STATUS" != "healthy" ]
do
    STATUS=$(docker inspect --format {{.State.Health.Status}} kong-database)
    echo "kong-database state = $STATUS"
    sleep 5
done

# "Run database migrations..."
docker-compose up migrations

# "Starting kong..."
docker-compose up -d kong

echo "Kong admin running http://127.0.0.1:8001/"
echo

# "Starting konga..."
docker-compose up -d konga
