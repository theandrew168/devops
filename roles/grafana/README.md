# grafana
Ansible role for installing and configuring a [Grafana Cloud Agent](https://grafana.com/docs/grafana-cloud/agent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `grafana_integrations` | `[]` | List of desired integrations |
| `grafana_version` | `0.18.4` | Grafana Cloud Agent version |
| `grafana_username_prometheus` | `~` | Grafana Cloud Prometheus username |
| `grafana_username_loki` | `~` | Grafana Cloud Loki username |
| `grafana_password` | `~` | Grafana Cloud password / API key |
| `grafana_postgresql_connection_uri` | `~` | PostgreSQL integration connection string |
