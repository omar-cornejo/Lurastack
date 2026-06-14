# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_workspaces_image                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_workspaces_image" "this" {

  image_id              = ""     # string | required
  id                    = ""     # string | optional+computed

  # description           = ""     # string | computed
  # name                  = ""     # string | computed
  # operating_system_type = ""     # string | computed
  # required_tenancy      = ""     # string | computed
  # state                 = ""     # string | computed

}

