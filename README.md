# devops
This repo contains the automation I use for my personal projects and websites.
Two open source tools carry most of the weight: [Ansible](https://www.ansible.com/) and [Terraform](https://www.terraform.io/).
I currently use [DigitalOcean](https://www.digitalocean.com/) and [Linode](https://www.linode.com/) to host all of my infrastructure but this setup can be easily adapted to other hosting providers.

## Scheduling
In general, the infra managed by this repo operates on the following schedule.
Note that not all of these events occur each day.
System restarts, for example, only occur as needed (when a package or kernel update requires it).

| What | When |
| ---- | ---- |
| System restarts | 8:00 AM UTC (2:00 AM CST) |
| Database backups | 9:00 AM UTC (3:00 AM CST) |

## Install
First, follow the corresponding guides for [installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) and [installing Terraform](https://www.terraform.io/downloads.html).
You can verify that each tool is installed correctly by checking their versions:
```
ansible --version
terraform version
```

## Setup
If you are reading this then we must be collaborating on something.
Just reach out to me and I'll get you the actual credentials.
I like to export these environment variables in `$HOME/.profile` but you can put them wherever you prefer.
Just remember to either source the file after adding the vars or log out and back in again.

### Terraform Backend
Since Terraform's `.tfstate` files may contain sensitive information, a [DigitalOcean Space](https://www.digitalocean.com/products/spaces/) is used to keep them private.
Terraform views DigitalOcean Spaces as an S3 backend so the following environment variables (also obtained from the web console) are necessary to hook everything up:
```
export AWS_ACCESS_KEY_ID="spaces_key_from_web_console"
export AWS_SECRET_ACCESS_KEY="spaces_secret_from_web_console"
```

### Terraform DigitalOcean Access
Terraform needs an access token in order to talk to DigitalOcean.
This token can be obtained from DigitalOcean's web console:
```
export DIGITALOCEAN_TOKEN="access_token_from_web_console"
```

Additionally, a few more vars are needed in order to interact with DigitalOcean Spaces (S3-compatible object storage):
```
export SPACES_ACCESS_KEY_ID="spaces_key_from_web_console"
export SPACES_SECRET_ACCESS_KEY="spaces_secret_from_web_console"
```

### Terraform Linode Access
Terraform needs an access token in order to talk to Linode.
This token can be obtained from Linode's web console:
```
export LINODE_TOKEN="access_token_from_web_console"
```

### Terraform Init
The only thing left to do now is initialize Terraform for each project:
```
cd infra/<project>/
terraform init
```

### Ansible Vault Password
Since Ansible is occasionally used to deploy encrypted values, a password is needed in order to decrypt them.
Throw the correct password (ask an existing team member) into `$HOME/.vault_pass.txt` and export this environment variable which points to it's location:
```
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.vault_pass.txt"
```

## Usage
In general, setting up a server for app hosting involves two steps:
1. use Terraform to create the droplet and associated hostname
2. use Ansible to configure the server

The Ansible playbook only needs to be executed once (when the droplet is initially created) to setup the SSH configuration, firewall rules, unattended ugprades, etc.

### Terraform
The Terraform workflow is quite simple: use the [plan command](https://www.terraform.io/docs/cli/commands/plan.html) to see what changes are pending and then the [apply command](https://www.terraform.io/docs/cli/commands/apply.html) to apply them.
That last `refresh-only` command picks up default tags and other resource nuances added automatically after initial creation.
```
cd infra/<project>/
terraform plan
terraform apply
terraform apply -refresh-only
```

### Ansible
Next, we need to run Ansible to get the server ready for hosting an application.
Note that this only has to happen once when the droplet is first created.
```
ansible-playbook -i hosts -u <user> --ask-become-pass foobar.yml
```
