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
In general, I have two general app pipelines: use Ansible to setup a droplet for deployments via [GitHub Actions](https://github.com/features/actions) or let Digital Ocean's [app platform](https://www.digitalocean.com/products/app-platform/) do all of the heavy lifting.
Both start with Terraform but the droplet-based approach needs a one-time off of Ansible to setup dependencies, firewalls, GitHub access keys, systemd units, etc.

The Terraform workflow is quite simple: use the [plan command](https://www.terraform.io/docs/cli/commands/plan.html) to see what changes are pending and then the [apply command](https://www.terraform.io/docs/cli/commands/apply.html) to apply them.
```
cd infra/
terraform plan
terraform apply
```

If this is for an app platform-based application, then we are done!
That's all it takes, really.
Once active, Digital Ocean will watch for new changes to the repo and auto-deploy the latest code.
It even handles the acquisition and renewal of a TLS certificate which is a big win.

For droplet-based applictions, we need to run Ansible to get the server ready for hosting an application.
Note that this only has to happen once when the droplet is first created.
```
ansible-playbook -u root -i hosts <playbook_file>
```

## Directory Structure
`group_vars/` - Ansible variables for specific deployments  
`infra/` - Terraform config files for Digital Ocean infrastructure  
`roles/` - Ansible roles for various applications and components  
