# vmagent
Ansible role for installing and configuring [vlagent](https://docs.victoriametrics.com/victorialogs/vlagent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `vlagent_version` | `v1.52.0` | Version of vlagent to install |
| `vlagent_remote_server_ip` | `~` | IP address of the remote victoria_logs server |
| `vlagent_log_namespace` | `~` | Namespace of journald logs to collect |