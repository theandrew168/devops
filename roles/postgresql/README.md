# postgresql
Ansible role for installing and configuring a [PostgreSQL](https://www.postgresql.org/) database cluster

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `postgresql_data_directory` | `~` | PostgreSQL data directory (defaults to package default) |
| `postgresql_listen_addresses` | `[]` | PostgreSQL listen addresses (defaults to localhost only) |
| `postgresql_extra_hba_entries` | `[]` | PostgreSQL extra pg_hba.conf entries |
| `postgresql_users` | `[]` | PostgreSQL cluster users |
| `postgresql_databases` | `[]` | PostgreSQL cluster databases |
| `postgresql_tuning_parameters` | `[]` | PostgreSQL tuning parameters |
