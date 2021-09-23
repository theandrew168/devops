# postgresql
Ansible role for installing and configuring a [PostgreSQL](https://www.postgresql.org/) database cluster

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `postgresql_listen_address` | `~` | PostgreSQL listen address (defaults to local-only) |
| `postgresql_data_directory` | `~` | PostgreSQL data directory (defaults to package default) |
| `postgresql_users` | `[]` | PostgreSQL cluster users |
| `postgresql_databases` | `[]` | PostgreSQL cluster databases |
| `postgresql_tuning_parameters` | `[]` | PostgreSQL tuning parameters |
