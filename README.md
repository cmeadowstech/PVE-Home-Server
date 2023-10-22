# PVE Home Server

I recently moved over my poor little Raspberry Pi server to an old laptop running Proxmox VE. It's been working well enough so far, but thought it'd be a good opportunitiy to plunge into Ansible. Also taking advantage of Terraform. So if something were to happen, it'd be easy to rebuild my server from scratch.

Currently working on playbooks for the following:
- Pi-Hole - samba.yml
- Samba - samba.yml

Still need to begin on a few others:
- Syncthing
- Plex
- Some dashboard like Homarr