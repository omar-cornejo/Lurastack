# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_parameter                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_parameter" "this" {

  name            = ""     # string | required
  id              = ""     # string | optional+computed
  with_decryption = false  # bool | optional

  # arn             = ""     # string | computed
  # insecure_value  = ""     # string | computed
  # type            = ""     # string | computed
  # value           = ""     # string | computed+sensitive
  # version         = 0      # number | computed

}

