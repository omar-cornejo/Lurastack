# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_parameters_by_path                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_parameters_by_path" "this" {

  path            = ""     # string | required
  id              = ""     # string | optional+computed
  recursive       = false  # bool | optional
  with_decryption = false  # bool | optional

  # arns            = []     # list(string) | computed
  # names           = []     # list(string) | computed
  # types           = []     # list(string) | computed
  # values          = []     # list(string) | computed+sensitive

}

