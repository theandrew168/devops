# vmagent
Ansible role for installing and configuring [vmagent](https://docs.victoriametrics.com/victoriametrics/vmagent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `vmagent_version` | `v1.149.0` | Version of vmagent to install |
| `vmagent_remote_server_ip` | `~` | IP address of the remote victoria-metrics server |
| `vmagent_scrape_config` | `~` | Scrape config file contents (prometheus format) |