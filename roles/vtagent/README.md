# vmagent
Ansible role for installing and configuring [vtagent](https://docs.victoriametrics.com/victoriatraces/vtagent/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `vtagent_version` | `v0.11.0` | Version of vtagent to install |
| `vtagent_remote_server_ip` | `~` | IP address of the remote victoria_traces server |