# devops
This repo contains the automation I use for my personal projects and websites.
Two open source tools carry most of the weight: [Ansible](https://www.ansible.com/) and [Terraform](https://www.terraform.io/).
I currently use [Digital Ocean](https://www.digitalocean.com/) to host all of my infrastructure but this setup can be easily adapted to other hosting providers.

## Scheduling
In general, the infra managed by this repo operates on the following schedule.
Note that not all of these events occur each day.
System restarts, for example, only occur as needed (when a package or kernel update requires it).

| What | When |
| ---- | ---- |
| Database backups | 7:00 AM UTC (2:00 AM CST) |
| System restarts | 8:00 AM UTC (3:00 AM CST) |

## Install
First, follow the corresponding guides for [installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) and [installing Terraform](https://www.terraform.io/downloads.html).
You can verify that each tool is installed correctly by checking their versions:
```
ansible --version
terraform version
```

## Setup
If you are reading this then we must be collaborating on something. Hell yeah!
Just reach out to me and I'll get you the actual credentials.
I like to export these environment variables in `$HOME/.profile` but you can put them wherever you prefer.
Just remember to either source the file after adding the vars or log out and back in again.

### SSH Config
When dealing with infrastructure that is deployed within a [VPC](https://en.wikipedia.org/wiki/Virtual_private_cloud), all SSH connections (and therefore Ansible connections) must route through a specified "gateway" (aka "bastion") server.
SSH (and Ansible) can be configured (via `~/.ssh/config`) to handle these jumps transparently on a per-VPC basis:
```
# template
Host <vpc_network_wildcard>
    ProxyCommand ssh -W %h:%p root@<vpc_gateway_public_ip>

# example
Host 10.0.0.*
    ProxyCommand ssh -W %h:%p root@64.225.52.149
```

### Ansible Vault Password
Since Ansible is occasionally used to deploy encrypted values, a password is needed in order to decrypt them.
Throw the correct password (ask an existing team member) into `$HOME/.vault_pass.txt` and export this environment variable which points to it's location:
```
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.vault_pass.txt"
```

### Terraform DigitalOcean Access
Terraform needs an access token in order to talk to Digital Ocean.
This token can be obtained from Digital Ocean's web console:
```
export DIGITALOCEAN_TOKEN="access_token_from_web_console"
```

### Terraform Backend
Additionally, since Terraform's `.tfstate` file may contain sensitive information, a [DigitalOcean Space](https://www.digitalocean.com/products/spaces/) is used to keep it private.
Terraform views DigitalOcean Spaces as an S3 backend so the following environment variables (also obtained from the web console) are necessary to hook everything up:
```
export AWS_ACCESS_KEY_ID="spaces_key_from_web_console"
export AWS_SECRET_ACCESS_KEY="spaces_secret_from_web_console"
```

### Terraform Init
The only thing left to do now is initialize Terraform:
```
cd infra/
terraform init
```

## Usage
In general, setting up a server for app hosting involves three steps: use Terraform to create the droplet and associated a hostname, use Ansible to configure the server, then setup secrets to grant [GitHub Actions](https://github.com/features/actions) access to the droplet.
The Ansible playbook only needs to be executed once (when the droplet is initially created) to setup firewall rules, GitHub access keys, systemd units, etc.

### Terraform
The Terraform workflow is quite simple: use the [plan command](https://www.terraform.io/docs/cli/commands/plan.html) to see what changes are pending and then the [apply command](https://www.terraform.io/docs/cli/commands/apply.html) to apply them.
That last `refresh-only` command picks up default tags and other resource nuances added automatically after initial creation.
```
cd infra/
terraform plan
terraform apply
terraform apply -refresh-only
```

### Ansible
Next, we need to run Ansible to get the server ready for hosting an application.
Note that this only has to happen once when the droplet is first created.
```
ansible-playbook -u root -i hosts foobar.yml
```

## GitHub Actions
On top of using GitHub Actions for automating testing and builds, I use it to push verified artifacts out to the server.
This isn't magic, of course, so some credentials are needed in order to do this.
The following values must be manually setup on the repo using GitHub's [secrets](https://docs.github.com/en/actions/reference/encrypted-secrets) feature.

| Name | Description |
| --- | --- |
| `FOOBAR_HOSTNAME` | Hostname associated with the application server |
| `FOOBAR_SSH_USER` | SSH user to use when connecting to the server |
| `FOOBAR_SSH_KEY` | SSH private key used to authenticate with the server |

### Workflow Setup
With the credentials in place, the only thing left is to add a couple workflow steps for copying the new artifact out to the server and then restarting the service.
This is just a snippet!
You can read more about the full syntax for GitHub Action workflows [here](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions).
```
- uses: appleboy/scp-action@master
  with:
    host: ${{ secrets.FOOBAR_HOSTNAME }}
    username: ${{ secrets.FOOBAR_SSH_USER }}
    key: ${{ secrets.FOOBAR_SSH_KEY }}
    source: foobar
    target: /home/${{ secrets.FOOBAR_SSH_USER }}/
- uses: appleboy/ssh-action@master
  with:
    host: ${{ secrets.FOOBAR_HOSTNAME }}
    username: ${{ secrets.FOOBAR_SSH_USER }}
    key: ${{ secrets.FOOBAR_SSH_KEY }}
    script: |
      sudo systemctl restart foobar
```

## Directory Structure
`group_vars/` - Ansible variables for specific deployments  
`infra/` - Terraform config files for Digital Ocean infrastructure  
`roles/` - Ansible roles for various applications and components  
