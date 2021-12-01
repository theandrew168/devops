# postgresql
Ansible role for installing and configuring a [PostgreSQL](https://www.postgresql.org/) database cluster

## TODO
* Auto tune based on specs and usage

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `postgresql_data_dir` | `~` | PostgreSQL data directory (defaults to package default) |
| `postgresql_private_network_ip` | `~` | Server private network IP (if applicable) |
| `postgresql_private_network_cidr` | `~` | Server private network CIDR (if applicable) |
| `postgresql_users` | `[]` | PostgreSQL cluster users |
| `postgresql_databases` | `[]` | PostgreSQL cluster databases |
| `postgresql_extensions` | `['pg_stat_statements']` | PostgreSQL database extensions |
| `postgresql_tuning_parameters` | `[]` | PostgreSQL tuning parameters |
