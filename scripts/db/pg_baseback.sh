#!/bin/bash

if [[ -z "$DB_HOSTNAME" ]]; then
  echo "Please set DB_HOSTNAME" && exit 1
fi

if [[ -z "$DB_USER" ]]; then
  echo "Please set DB_USER" && exit 1
fi

echo "Creating basebackup from ${DB_HOSTNAME} with user ${DB_USER}"

psql_data_target="psql_basebkp_$(date +'%Y%m%d_%H%M%S')"

mkdir ${psql_data_target}

echo "Writting basebackup to ${psql_data_target}"

pg_basebackup --host=${DB_HOSTNAME} --user=${DB_USER} --pgdata ${psql_data_target} --progress
