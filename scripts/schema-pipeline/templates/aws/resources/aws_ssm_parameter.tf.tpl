# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_parameter                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_parameter" "this" {

  name             = ""     # string | required
  type             = ""     # string | required
  allowed_pattern  = ""     # string | optional
  arn              = ""     # string | optional+computed
  data_type        = ""     # string | optional+computed
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  insecure_value   = ""     # string | optional+computed
  key_id           = ""     # string | optional+computed
  overwrite        = false  # bool | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed
  tier             = ""     # string | optional+computed
  value            = ""     # string | optional+computed+sensitive
  value_wo         = ""     # string | optional+sensitive+write_only
  value_wo_version = 0      # number | optional

  # has_value_wo     = false  # bool | computed
  # version          = 0      # number | computed

}

