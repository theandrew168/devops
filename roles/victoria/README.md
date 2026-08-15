# victoria
Ansible role for installing and configuring the "Victoria Stack": [Metrics](https://docs.victoriametrics.com/victoriametrics/), [Logs](https://docs.victoriametrics.com/victorialogs/), and [Traces](https://docs.victoriametrics.com/victoriatraces/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `victoria_internal_listen_host` | `~` | Internal (VPC) IP address to listen on |
| `victoria_metrics_version` | `v1.149.0` | Version of victoria metrics to install |
| `victoria_metrics_data_dir` | `~` | Directory to hold victoria metrics data |
| `victoria_logs_version` | `v1.52.0` | Version of victoria logs to install |
| `victoria_logs_data_dir` | `~` | Directory to hold victoria logs data |
| `victoria_traces_version` | `v0.10.0` | Version of victoria traces to install |
| `victoria_traces_data_dir` | `~` | Directory to hold victoria traces data |