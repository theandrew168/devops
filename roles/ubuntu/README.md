# ubuntu
Ansible role for configuring and securing an [Ubuntu](https://ubuntu.com/) server

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `firewall_rules` | `[]` | Ubuntu firewall rules |
| `vpc_network_prefix` | `~` | VPC network CIDR range |
| `vpc_gateway_private_ip` | `~` | VPC private IP of gateway node |
| `vpc_is_gateway` | `no` | VPC host var indicating gateway node |
| `vpc_is_internal` | `no` | VPC host var indicating internal nodes |
