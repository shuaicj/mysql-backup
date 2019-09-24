#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DB_NAME="hellomysql"
BACKUP_DIR="${DIR}/backup"

TIME_NOW="$(date '+%Y%m%d-%H%M%S')"
BACKUP_PATH="${BACKUP_DIR}/${DB_NAME}-${TIME_NOW}.sql.gz"


# Do a full backup via command `mysqldump`.
#
# --defaults-extra-file:
#     use the config file to store username and password, because the -u, -p options
#     will show a warning message saying it's insecure.
#
# --single-transaction:
#     dump in single transaction, recommended with InnoDB.
#
# --flush-logs:
#     rotate a new binlog file before dump, so the dumped sql is a full backup,
#     and this new binlog file is incremental.
#
# --master-data=2:
#     remember the above binlog name in dumped sql.
#
# --delete-master-logs:
#     delete old binlog files, use this option with caution.
#

mysqldump --defaults-extra-file=${DIR}/mysql-client.cnf \
    --single-transaction --flush-logs --master-data=2 \
    ${DB_NAME} | gzip > ${BACKUP_PATH}

