# minecraft
Ansible role for installing and configuring a [Minecraft](https://minecraft.wiki/w/Tutorials/Setting_up_a_server) server

## Configuration
Beta 1.7.3 server.properties [reference](https://old.reddit.com/r/GoldenAgeMinecraft/comments/14itvbx/how_to_correctly_set_up_a_minecraft_alphabeta/)

| Variable | Default | Description |
| -------- | ------- | ----------- |
| `minecraft_era` | `beta` | Minecraft era (alpha, beta, classic, or release) |
| `minecraft_version` | `b1.7.3` | Version to install |
| `minecraft_data_dir` | `~` | Minecraft server data directory |
| `minecraft_jvm_opts` | `~` | Minecraft server JVM options |
| `minecraft_config` | `~` | Config file contents (server.properties) |
| `minecraft_users` | `~` | Allowed users (by Mojang/Microsoft username) |
| `minecraft_allowed_ips` | `[]` | Allowed IP addresses / ranges (allow all if empty) |
