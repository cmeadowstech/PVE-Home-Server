<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.14 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pihole"></a> [pihole](#module\_pihole) | ./modules/lxc | n/a |
| <a name="module_samba"></a> [samba](#module\_samba) | ./modules/lxc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_password"></a> [password](#input\_password) | Password for root user | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->