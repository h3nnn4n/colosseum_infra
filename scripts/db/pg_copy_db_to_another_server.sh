#!/bin/bash

pg_dump -C -h codecon-db.colosseum.website -U colosseum_codecon colosseum_codecon | psql -h codecon.colosseum.website -U colosseum_codecon colosseum_codecon
