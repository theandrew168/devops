# pg2s3
Ansible role for installing and configuring the [pg2s3](https://github.com/theandrew168/pg2s3) database backup tool

## Configuration
Encryption, decryption, and key generation are handled by the [age](https://github.com/FiloSottile/age) tool.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| `pg2s3_version` | `0.1.0` | Version to install |
| `pg2s3_os` | `linux` | Target operating system |
| `pg2s3_arch` | `amd64` | Target architecture |
| `pg2s3_config` | `~` | Config file contents |
