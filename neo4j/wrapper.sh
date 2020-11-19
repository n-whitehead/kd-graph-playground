#!/bin/bash

# Start primary neo4j process
/docker-entrypoint.sh neo4j

# Start the data extraction process. Wait for neo4j process to finish first.
# Attempt to uncompress large db files as separate databases.
for file in /data/graphs/*.tar.bz2
do
  echo "---- Extracting [$(basename $file)] ----"
  tar -xf $file --directory /data/databases
done