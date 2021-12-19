# server
Ansible role for configuring and securing an [Ubuntu](https://ubuntu.com/) server

## Enhancements
Some ideas to make this role better / more secure:

* Disable root password (done)
* SSH only permits pubkey auth (done)
* SSH disable root login (chicken and the egg?)
* SSH on non-standard port (2121?)
* Connect to servers using a non-root user
* Require a sudo password for become tasks
* Document new server prep steps (per admin)
  * create user
  * strong pass (for sudo w/ ansible)
  * pubkey setup (can't ssh-copy-id)
  * member of sudo group
  * mkdir .ssh 700
  * touch .ssh/authorized_keys 600
  * if compro, delete user

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `server_hostname` | `~` | Server hostname |
| `server_mounted_volumes` | `[]` | List of mounted volumes |
