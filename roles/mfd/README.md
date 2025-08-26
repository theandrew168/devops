# mfd
Ansible role for installing and configuring the [mfd](https://github.com/theandrew168/mfd) multi-file application deployment tool.

## Configuration

| Variable | Default | Description |
| -------- | ------- | ----------- |
| `mfd_version` | `latest` | Version to install |
| `mfd_os` | `linux` | Target operating system |
| `mfd_arch` | `amd64` | Target architecture |
| `mfd_config_path` | `~` | Config file path |
| `mfd_config` | `~` | Config file contents |
