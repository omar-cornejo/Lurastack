# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_datazone_environment_blueprint                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_datazone_environment_blueprint" "this" {

  domain_id          = ""     # string | required
  managed            = false  # bool | required
  name               = ""     # string | required

  # blueprint_provider = ""     # string | computed
  # description        = ""     # string | computed
  # id                 = ""     # string | computed

}

