# with_cake

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/nexient-llc/tf-azurerm-module-resource_group.git | 0.2.0 |
| <a name="module_user_managed_identity"></a> [user\_managed\_identity](#module\_user\_managed\_identity) | git::https://github.com/nexient-llc/tf-azurerm-module_primitive-user_managed_identity.git | feature/update |
| <a name="module_role_assignment"></a> [role\_assignment](#module\_role\_assignment) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [random_integer.priority](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"platform"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Resource Group exist. Changing this forces a new Resource Group to be created. | `string` | `"EastUS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Storage Account. | `map(string)` | `{}` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | (Optional) Name of the Role Definition. Changing this forces a new resource to be created. Example: Reader | `string` | `"Reader"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignment_id"></a> [role\_assignment\_id](#output\_role\_assignment\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
