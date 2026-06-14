# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_resourcegroups_resource                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_resourcegroups_resource" "this" {

  group_arn     = ""     # string | required
  resource_arn  = ""     # string | required
  id            = ""     # string | optional+computed

  # resource_type = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

