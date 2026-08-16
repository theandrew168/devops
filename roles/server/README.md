# server
Ansible role for configuring and securing an [Ubuntu](https://ubuntu.com/) server

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `server_hostname` | `~` | Server hostname |
| `server_internal_network_ip` | `~` | Internal network IP address |
| `server_internal_network_cidr` | `~` | Internal network CIDR |
| `server_admin_users` | `[]` | List of admin users |
| `server_mounted_volumes` | `[]` | List of mounted volumes |
