#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
export MYSQL_PWD=$DB_PASSWORD
set -ex

mkdir -p dump/data

arg="-h$DB_HOST -P$DB_PORT -u$DB_USER $DB_NAME"

mysqldump $arg \
  --skip-set-charset \
  --events \
  --no-data \
  --skip-add-drop-table \
  --routines >dump/table.sql

ignore=("state")
set +x
for table in $(mysql $arg -e 'show tables' | tail -n +2); do
  if ! [[ ${ignore[@]} =~ ${table} ]]; then
    mysqldump -t $arg $table >dump/data/$table.sql
    echo $table
  fi
done
./dump.py
