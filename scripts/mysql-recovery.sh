#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DB_NAME="hellomysql"
FULL_BACKUP="${DIR}/hellomysql-20190924-114452.sql.gz"
INC_BACKUP_1="/usr/local/var/mysql/mysql-bin.000001"
INC_BACKUP_2="/usr/local/var/mysql/mysql-bin.000002"

# Do recovery with the full backup sql.
gunzip < ${FULL_BACKUP} | mysql --defaults-extra-file=${DIR}/mysql-client.cnf ${DB_NAME}

# Do recovery with the incremental backup binlog.
mysqlbinlog ${INC_BACKUP_1} ${INC_BACKUP_2} | mysql --defaults-extra-file=${DIR}/mysql-client.cnf ${DB_NAME}


