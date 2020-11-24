#!/bin/bash

mkdir -p /data/databases /data/transactions

for entry in /tmp/graphs/*.dump
do
  fileName=$(basename "$entry")
  dbName="${fileName%.*}"
  echo "---- Importing [$fileName] ----"
  neo4j-admin load --from=$entry --database=$dbName --force
done

chown -R neo4j:neo4j /data

# Run existing neo4j entrypoint script after.
/docker-entrypoint.sh neo4j