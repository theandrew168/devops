# pg2s3
Ansible role for installing and configuring the [pg2s3](https://github.com/theandrew168/pg2s3) database backup tool

## Configuration
More info about systemd timers can be found [here](https://wiki.archlinux.org/title/Systemd/Timers).
Encryption, decryption, and key generation are handled by the [age](https://github.com/FiloSottile/age) tool.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| `pg2s3_version` | `0.0.11` | Version of pg2s3 to install |
| `pg2s3_backup_name` | `pg2s3` | Name to label the service and environment files |
| `pg2s3_backup_frequency` | `*-*-* 9:00:00` | OnCalendar expression for the systemd timer |
| `pg2s3_backup_retention` | `30` | Number of backups to retain after pruning |
| `pg2s3_pg_connection_uri` | `~` | PostgreSQL connection string |
| `pg2s3_s3_endpoint` | `~` | S3-compatible storage endpoint |
| `pg2s3_s3_access_key_id` | `~` | S3-compatible storage access key ID |
| `pg2s3_s3_secret_access_key` | `~` | S3-compatible storage secret access key |
| `pg2s3_s3_bucket_name` | `~` | S3-compatible storage bucket name |
| `pg2s3_age_public_key` | `~` | Public key for backup encryption |
