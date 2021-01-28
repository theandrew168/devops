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

## Directory Structure
`group_vars/` - Ansible variables for specific deployments  
`infra/` - Terraform config files for Digital Ocean infrastructure  
`roles/` - Ansible roles for various applications and components  
