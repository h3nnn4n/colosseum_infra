#!/bin/bash

pg_restore \
  --verbose \
  --host=db2.colosseum.website \
  --port=5432 \
  --username=colosseum_prod \
  --clean \
  --create \
  --format=t \
  --dbname=colosseum_prod \
  ./dump_colosseum_prod.tar
