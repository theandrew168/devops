# agent
Ansible role for installing and configuring [Grafana Agent](https://grafana.com/docs/grafana-cloud/agent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `agent_integrations` | `[]` | List of desired integrations |
| `agent_version` | `0.18.4` | Grafana Agent version |
| `agent_username_prometheus` | `~` | Grafana Prometheus username |
| `agent_username_loki` | `~` | Grafana Loki username |
| `agent_password` | `~` | Grafana password / API key |
| `agent_postgresql_connection_uri` | `~` | PostgreSQL integration connection string |
