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

#### SMB Shares

While possibly not the best way to handle storage, I needed Samba to act as a NAS anyways so my actual devices can access the storage.

To configure, there are two places to update:
1. The var file Ansible/group_vars/samba/samba.yml contains the share created. There is one for the entire drive that my devices use, as well as shares more narrow in scope for other services running on PVE.
2. The vault located at Ansible/group_vars/all/vault contains the users and passwords for the Samba users. For ease of use, these users are named the same as the shares.
