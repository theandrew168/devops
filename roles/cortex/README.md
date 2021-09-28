# cortex
Ansible role for installing and configuring [Cortex](https://cortexmetrics.io/)

## Configuration
| Variable | Default | Description |
| -------- | ------- | ----------- |
| `cortex_version` | `1.10.0` | Cortex version |
| `cortex_retention` | `90d` | How long to keep historic metric data |
| `cortex_s3_endpoint` | `~` | S3-compatible storage endpoint |
| `cortex_s3_access_key_id` | `~` | S3-compatible storage access key ID |
| `cortex_s3_secret_access_key` | `~` | S3-compatible storage secret access key |
| `cortex_s3_bucket_name` | `~` | S3-compatible storage bucket name |
