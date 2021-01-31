# devops
This repo contains the automation I use for my personal projects and websites.
Two open source tools carry most of the weight: [Ansible](https://www.ansible.com/) and [Terraform](https://www.terraform.io/).
I currently use [Digital Ocean](https://www.digitalocean.com/) to host all of my infrastructure but this setup can be easily adapted to other hosting providers.

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

Since Ansible is occasionally used to deploy encrypted values, a password is needed in order to decrypt them.
Throw the correct password into `$HOME/.vault_pass.txt` and export this environment variable which points to it's location:
```
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.vault_pass.txt"
```

Terraform needs an access token in order to talk to Digital Ocean.
This token can be obtained from Digital Ocean's web console (or myself).
```
export DIGITALOCEAN_ACCESS_TOKEN="actual_access_token_goes_here"
```

The only thing left to do now is initialize Terraform:
```
cd infra/
terraform init
```

## Usage
In general, setting up a server for app hosting involves three steps: use Terraform to create the droplet and associated a hostname, use Ansible to configure the server, then setup secrets to grant [GitHub Actions](https://github.com/features/actions) access to the droplet.
The Ansible playbook only needs to be executed once (when the droplet is initially created) to setup firewall rules, GitHub access keys, systemd units, etc.

The Terraform workflow is quite simple: use the [plan command](https://www.terraform.io/docs/cli/commands/plan.html) to see what changes are pending and then the [apply command](https://www.terraform.io/docs/cli/commands/apply.html) to apply them.
```
cd infra/
terraform plan
terraform apply
```

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
