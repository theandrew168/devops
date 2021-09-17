# postgresql
Ansible role for installing and configuring a [PostgreSQL](https://www.postgresql.org/) database cluster

## Security
This role exposes port 5432 in the firewall and configures PostgreSQL to listen on all incoming interfaces.
Therefore, be sure to only deploy this role on a node that is located within a VPC and set `postgresql_listen_address` to the VPC's subnet CIDR.

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `postgresql_listen_address` | `~` | PostgreSQL listen address |
| `postgresql_data_directory` | `~` | PostgreSQL data directory |
| `postgresql_users` | `[]` | PostgreSQL cluster users |
| `postgresql_databases` | `[]` | PostgreSQL cluster databases |
| `postgresql_tuning_parameters` | `[]` | PostgreSQL tuning parameters |
