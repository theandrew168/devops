# redis
Ansible role for installing and configuring a [Redis](https://redis.io/) server

## Security
This role exposes port 6379 in the firewall and configures Redis to listen on all incoming interfaces.
Therefore, be sure to only deploy this role on a node that is located within a VPC.

## Configuration
No variables necessary.
