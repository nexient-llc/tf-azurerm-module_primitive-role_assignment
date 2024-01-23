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

resource "random_integer" "priority" {
  min = 10000
  max = 50000
}

module "resource_group" {
  source = "git::https://github.com/nexient-llc/tf-azurerm-module-resource_group.git?ref=0.2.0"

  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}

module "user_managed_identity" {
  source = "git::https://github.com/nexient-llc/tf-azurerm-module_primitive-user_managed_identity.git?ref=feature/update"

  resource_group_name         = module.resource_group.name
  location                    = var.location
  user_assigned_identity_name = local.identity_name

  depends_on = [module.resource_group]
}

module "role_assignment" {
  source = "../.."

  principal_id         = module.user_managed_identity.principal_id
  scope                = module.resource_group.id
  role_definition_name = var.role_definition_name

  depends_on = [module.user_managed_identity]

}
