# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_organization_configuration          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_organization_configuration" "this" {

  auto_enable           = false  # bool | required
  auto_enable_standards = ""     # string | optional+computed
  id                    = ""     # string | optional+computed

  organization_configuration { # list [0..1]
    configuration_type = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

