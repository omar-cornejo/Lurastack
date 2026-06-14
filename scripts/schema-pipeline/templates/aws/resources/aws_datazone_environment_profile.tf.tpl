# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_environment_profile                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_environment_profile" "this" {

  aws_account_region               = ""     # string | required
  domain_identifier                = ""     # string | required
  environment_blueprint_identifier = ""     # string | required
  name                             = ""     # string | required
  project_identifier               = ""     # string | required
  aws_account_id                   = ""     # string | optional+computed
  description                      = ""     # string | optional+computed

  # created_at                       = ""     # string | computed
  # created_by                       = ""     # string | computed
  # id                               = ""     # string | computed
  # updated_at                       = ""     # string | computed

  user_parameters { # list
    name  = ""     # string | optional
    value = ""     # string | optional

  }

}

