// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "resource_names" {
  source = "git::https://github.com/nexient-llc/tf-module-resource_name.git?ref=1.0.0"

  for_each = var.resource_names_map

  logical_product_family  = var.product_family
  logical_product_service = var.product_service
  region                  = join("", split("-", var.region))
  class_env               = var.environment
  cloud_resource_type     = each.value.name
  instance_env            = var.environment_number
  instance_resource       = var.resource_number
  maximum_length          = each.value.max_length
}

module "resource_group" {
  source = "git::https://github.com/nexient-llc/tf-azurerm-module-resource_group.git?ref=0.2.0"

  name     = module.resource_names["rg"].dns_compliant_minimal_random_suffix
  location = var.region
  tags     = local.tags
}

module "user_managed_identity" {
  source = "git::https://github.com/nexient-llc/tf-azurerm-module_primitive-user_managed_identity.git?ref=feature/update"

  resource_group_name         = module.resource_group.name
  location                    = var.region
  user_assigned_identity_name = module.resource_names["msi"].dns_compliant_minimal_random_suffix

  depends_on = [module.resource_group]
}

module "role_assignment" {
  source = "../.."

  principal_id         = module.user_managed_identity.principal_id
  scope                = module.resource_group.id
  role_definition_name = var.role_definition_name

  depends_on = [module.user_managed_identity]

}
