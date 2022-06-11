#!/bin/bash

pg_dump \
  --verbose \
  --host=db.colosseum.website \
  --port=5432 \
  --username=colosseum_prod \
  --format=t \
  --create \
  --file \
  ./dump_colosseum_prod.tar \
  -n public \
  colosseum_prod
