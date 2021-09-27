# web_app
Ansible role for configuring a single-binary web application

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `web_app_name` | `~` | Web application name |
| `web_app_user` | `~` | Web application user |
| `web_app_is_jar` | `no` | Whether the web app is a JAR |
| `web_app_proxy_port` | `~` | Web application proxy port (not 80/443) |
| `web_app_systemd_dependencies` | `[]` | Web application systemd dependencies |
| `web_app_deployment_key` | `~` | Web application deployment key |
| `web_app_env_vars` | `[]` | Web application environment variables |
