#!/bin/bash

pg_dump \
  --verbose \
  --host=db.colosseum.website \
  --port=5432 \
  --username=colosseum_prod \
  --format=t \
  --create \
  -n public \
  colosseum_prod \
  | pg_restore \
  --verbose \
  --host=db2.colosseum.website \
  --port=5432 \
  --username=colosseum_prod \
  --clean \
  --create \
  --format=t \
  --dbname=colosseum_prod
