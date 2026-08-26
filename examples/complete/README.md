# Complete Example

This example creates an EventBridge schema registry and a schema of type OpenApi3.

## Usage

```hcl
data "aws_region" "current" {}

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 2.0"

  for_each = var.resource_names_map

  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
  class_env               = var.class_env
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  cloud_resource_type     = each.value.name
  maximum_length          = each.value.max_length

  region                = join("", split("-", data.aws_region.current.name))
  use_azure_region_abbr = false
}


resource "aws_schemas_registry" "this" {
  name        = module.resource_names["registry"].standard
  description = "Registry for the complete schema example."
}

module "schemas_schema" {
  source = "../.."

  name          = var.schema_name
  registry_name = aws_schemas_registry.this.name
  type          = var.type
  content       = var.content
  description   = var.description
  tags          = var.tags
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.100 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 2.0 |
| <a name="module_schemas_schema"></a> [schemas\_schema](#module\_schemas\_schema) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_schemas_registry.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/schemas_registry) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | Class environment for resource naming (for example, dev). | `string` | n/a | yes |
| <a name="input_content"></a> [content](#input\_content) | Schema content as a JSON string matching the selected type. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the schema. | `string` | `null` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Instance environment for resource naming. | `number` | n/a | yes |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Instance resource for resource naming. | `number` | n/a | yes |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | Logical product family for resource naming. | `string` | n/a | yes |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | Logical product service for resource naming. | `string` | n/a | yes |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | Map of resource types to naming configuration. | <pre>map(object({<br/>    name       = string<br/>    max_length = number<br/>  }))</pre> | n/a | yes |
| <a name="input_schema_name"></a> [schema\_name](#input\_schema\_name) | Name of the schema. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the schema. | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of schema. Valid values are OpenApi3 and JSONSchemaDraft4. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the schema. |
| <a name="output_id"></a> [id](#output\_id) | ID of the schema. |
| <a name="output_name"></a> [name](#output\_name) | Name of the schema. |
| <a name="output_registry_name"></a> [registry\_name](#output\_registry\_name) | Name of the schema registry used by the example. |
| <a name="output_version"></a> [version](#output\_version) | Version of the schema. |
<!-- END_TF_DOCS -->
