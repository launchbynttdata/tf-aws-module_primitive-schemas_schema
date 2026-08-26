logical_product_family  = "lp"
logical_product_service = "lps"
class_env               = "dev"
instance_env            = 0
instance_resource       = 0

resource_names_map = {
  registry = {
    name       = "schemareg"
    max_length = 64
  }
}

schema_name = "SampleEvent"
type        = "OpenApi3"
content     = <<-EOT
{"openapi":"3.0.0","info":{"title":"SampleEvent","version":"1.0.0"},"paths":{},"components":{"schemas":{"SampleEvent":{"type":"object","properties":{"id":{"type":"string"}}}}}}
EOT
description = "Complete example schema."

tags = {
  Environment = "test"
  Terraform   = "true"
}
