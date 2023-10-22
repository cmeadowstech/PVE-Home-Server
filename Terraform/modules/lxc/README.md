<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_lxc.lxc](https://registry.terraform.io/providers/Telmate/proxmox/2.9.14/docs/resources/lxc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cores"></a> [cores](#input\_cores) | Number of CPU cores | `number` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname | `string` | n/a | yes |
| <a name="input_ip"></a> [ip](#input\_ip) | IP address, ending in /24 | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | How much memory, in MB | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for root user | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | n/a | `map(any)` | <pre>{<br>  "priv": "~/.ssh/pve-server",<br>  "pub": "~/.ssh/pve-server.pub"<br>}</pre> | no |
| <a name="input_unprivileged"></a> [unprivileged](#input\_unprivileged) | If the LXC is privileged or not | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->