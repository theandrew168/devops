# node_exporter

Ansible role for installing the Prometheus [node_exporter](https://github.com/prometheus/node_exporter)

## Configuration

| Variable                | Default | Description             |
| ----------------------- | ------- | ----------------------- |
| `node_exporter_version` | `1.7.0` | Version to install      |
| `node_exporter_os`      | `linux` | Target operating system |
| `node_exporter_arch`    | `amd64` | Target architecture     |
