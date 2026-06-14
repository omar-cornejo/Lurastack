# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_synthetics_runtime_version                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_synthetics_runtime_version" "this" {

  prefix           = ""     # string | required
  latest           = false  # bool | optional
  version          = ""     # string | optional

  # deprecation_date = ""     # string | computed
  # description      = ""     # string | computed
  # id               = ""     # string | computed
  # release_date     = ""     # string | computed
  # version_name     = ""     # string | computed

}

