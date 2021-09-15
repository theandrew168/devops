# postgresql
Ansible role for installing and configuring a [PostgreSQL](https://www.postgresql.org/) database cluster

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `postgresql_data_directory` | `/var/lib/postgresql/12/main` | PostgreSQL data directory |
| `postgresql_users` | `[]` | PostgreSQL cluster users |
| `postgresql_databases` | `[]` | PostgreSQL cluster databases |
