# ubuntu
Ansible role for configuring and securing an [Ubuntu](https://ubuntu.com/) server

## References
This VPC configuration is detailed in the [DigitalOcean documentation](https://docs.digitalocean.com/products/networking/vpc/resources/droplet-as-gateway/).

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `firewall_rules` | `[]` | Firewall rules (list of dicts with keys: rule, port) |
| `vpc_network_prefix` | `~` | (VPC) network CIDR range |
| `vpc_gateway_private_ip` | `~` | (VPC) private IP of gateway node |
| `vpc_is_gateway` | `no` | (VPC) host var indicating gateway node |
| `vpc_is_internal` | `no` | (VPC) host var indicating internal nodes |
