# redis
Ansible role for installing [Redis](https://redis.io/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `redis_maxmemory` | `100mb` | Upper bound on memory usage |
| `redis_maxmemory_policy` | `allkeys-lru` | How keys are evicted at max memory |