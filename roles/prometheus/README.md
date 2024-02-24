# prometheus

Ansible role for installing and configuring [prometheus](https://prometheus.io/)

## Configuration

| Variable              | Default  | Description             |
| --------------------- | -------- | ----------------------- |
| `prometheus_version`  | `2.45.3` | Version to install      |
| `prometheus_os`       | `linux`  | Target operating system |
| `prometheus_arch`     | `amd64`  | Target architecture     |
| `prometheus_data_dir` | `~`      | Metrics data directory  |
| `prometheus_config`   | `~`      | Config file contents    |
