# vpc
Ansible role for configuring a VPC of Digital Ocean droplets.

## References
The VPC configuration deployed by this role is detailed in [DigitalOcean's documentation](https://docs.digitalocean.com/products/networking/vpc/resources/droplet-as-gateway/).

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `vpc_network_prefix` | `~` | VPC network CIDR range |
| `vpc_gateway_private_ip` | `~` | VPC private IP of gateway node |
| `vpc_is_gateway` | `no` | VPC host var indicating gateway node |
| `vpc_is_internal` | `no` | VPC host var indicating internal nodes |
