# PVE Home Server

I recently moved over my poor little Raspberry Pi server to an old laptop running Proxmox VE. It's been working well enough so far, but thought it'd be a good opportunitiy to plunge into Ansible. Also taking advantage of Terraform. So if something were to happen, it'd be easy to rebuild my server from scratch.

Currently working on playbooks for the following:
- Pi-Hole - samba.yml
- Samba - samba.yml

Still need to begin on a few others:
- Syncthing
- Plex
- Some dashboard like Homarr

## Secrets

### Terraform

Using a secret.tfvars file:

```terraform
password = ""
```

Which can be ran via:

```
terraform apply -var-file secret.tfvars
```

### Ansible

Using the Ansible Vault, encrypted var file is /Ansible/group_vars/vault

Password file defined under ansible.cfg:

```
vault_password_file = ~/.pve_pass.txt
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->