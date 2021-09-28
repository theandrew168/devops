# agent
Ansible role for installing and configuring [Grafana Agent](https://grafana.com/docs/grafana-cloud/agent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `agent_version` | `0.18.4` | Grafana Agent version |
| `agent_scrape_interval` | `10s` | Scrape interval for metrics and logs |
| `agent_cortex_endpoint` | `~` | Cortex metrics push endpoint |
| `agent_cortex_username` | `~` | Cortex username |
| `agent_cortex_password` | `~` | Cortex password |
| `agent_loki_endpoint` | `~` | Loki logs push endpoint |
| `agent_loki_username` | `~` | Loki username |
| `agent_loki_password` | `~` | Loki password |
| `agent_redis_address` | `~` | Redis integration address |
| `agent_postgresql_connection_uri` | `~` | PostgreSQL integration connection URI |
| `agent_scrape_configs` | `[]` | List of prometheus scrape configs |
