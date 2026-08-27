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

output "id" {
  description = "ID of the schema."
  value       = module.schemas_schema.id
}

output "arn" {
  description = "ARN of the schema."
  value       = module.schemas_schema.arn
}

output "name" {
  description = "Name of the schema."
  value       = module.schemas_schema.name
}

output "version" {
  description = "Version of the schema."
  value       = module.schemas_schema.version
}

output "registry_name" {
  description = "Name of the schema registry used by the example."
  value       = aws_schemas_registry.this.name
}
