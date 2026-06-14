# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_organization_configuration_feature    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_organization_configuration_feature" "this" {

  auto_enable = ""     # string | required
  detector_id = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed

  additional_configuration { # list
    auto_enable = ""     # string | required
    name        = ""     # string | required

  }

}

