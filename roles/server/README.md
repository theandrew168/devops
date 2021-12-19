# server
Ansible role for configuring and securing an [Ubuntu](https://ubuntu.com/) server

## Enhancements
Some ideas to make this role better / more secure:

* SSH on non-standard port?
* Disable root login?
* Connect to servers using a non-root user
* Require a sudo password for become tasks
* Document new server prep steps (ansible user, password, sudoers group)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `server_hostname` | `~` | Server hostname |
| `server_mounted_volumes` | `[]` | List of mounted volumes |
