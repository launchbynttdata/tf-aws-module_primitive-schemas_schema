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

variable "name" {
  description = "Name of the schema. Must be between 1 and 385 characters."
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 385
    error_message = "Name must be between 1 and 385 characters."
  }
}

variable "registry_name" {
  description = "Name of the schema registry that contains this schema."
  type        = string
}

variable "type" {
  description = "Type of schema. Valid values are OpenApi3 and JSONSchemaDraft4."
  type        = string

  validation {
    condition     = contains(["OpenApi3", "JSONSchemaDraft4"], var.type)
    error_message = "Type must be OpenApi3 or JSONSchemaDraft4."
  }
}

variable "content" {
  description = "Schema content as a JSON string matching the selected type."
  type        = string
}

variable "description" {
  description = "Description of the schema."
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the schema."
  type        = map(string)
  default     = {}
}
