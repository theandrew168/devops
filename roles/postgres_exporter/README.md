# postgres_exporter

Ansible role for installing the Prometheus [postgres_exporter](https://github.com/prometheus-community/postgres_exporter)

## Configuration

| Variable                              | Default  | Description               |
| ------------------------------------- | -------- | ------------------------- |
| `postgres_exporter_version`           | `0.20.1` | Version to install        |
| `postgres_exporter_os`                | `linux`  | Target operating system   |
| `postgres_exporter_arch`              | `amd64`  | Target architecture       |
| `postgres_exporter_database_uri`      | `~`      | Database URI              |
| `postgres_exporter_database_username` | `~`      | Database username         |
| `postgres_exporter_database_password` | `~`      | Database password         |
