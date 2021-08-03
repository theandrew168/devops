# datomic 
Ansible role for installing and configuring a [Datomic](https://www.datomic.com/on-prem.html) database

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `datomic_version` | `1.0.6316` | Version of Datomic Pro to install |
| `datomic_databases` | `[]` | List of databases to be created |
| `datomic_download_username` | `~` | Username for downloading Datomic |
| `datomic_download_password` | `~` | Password for downloading Datomic |
| `datomic_storage_username` | `~` | Username for storage backend |
| `datomic_storage_password` | `~` | Password for storage backend |
| `datomic_peer_access_key` | `~` | Access key for peer connections |
| `datomic_peer_secret` | `~` | Secret for peer connections |
| `datomic_license` | `~` | Datomic Pro license (should be 6 lines) |
