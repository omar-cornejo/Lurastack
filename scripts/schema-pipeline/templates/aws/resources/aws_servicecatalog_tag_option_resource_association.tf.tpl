# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_tag_option_resource_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_tag_option_resource_association" "this" {

  resource_id           = ""     # string | required
  tag_option_id         = ""     # string | required
  id                    = ""     # string | optional+computed

  # resource_arn          = ""     # string | computed
  # resource_created_time = ""     # string | computed
  # resource_description  = ""     # string | computed
  # resource_name         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

