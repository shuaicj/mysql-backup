# MySQL backup

The scripts and configs to enable full and incremental backups in MySQL.

#### Directory Tree
- conf
  - mysql-client.cnf: the config for the command `mysql` and `mysqldump`.
  - mysql-server.cnf: the config for `mysqld` to enable `binlog`.
- crontab
  - mysql-backup-crontab: the crontab to do a full backup every 02:00.
- scripts
  - mysql-backup.sh: the backup script.
  - mysql-recovery.sh: the recovery script.

See also https://dev.mysql.com/doc/refman/5.7/en/backup-policy.html.
