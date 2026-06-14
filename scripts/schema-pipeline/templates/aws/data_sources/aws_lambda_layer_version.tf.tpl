# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_layer_version                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_layer_version" "this" {

  layer_name                  = ""     # string | required
  compatible_architecture     = ""     # string | optional
  compatible_runtime          = ""     # string | optional
  id                          = ""     # string | optional+computed
  version                     = 0      # number | optional+computed

  # arn                         = ""     # string | computed
  # code_sha256                 = ""     # string | computed
  # compatible_architectures    = []     # set(string) | computed
  # compatible_runtimes         = []     # set(string) | computed
  # created_date                = ""     # string | computed
  # description                 = ""     # string | computed
  # layer_arn                   = ""     # string | computed
  # license_info                = ""     # string | computed
  # signing_job_arn             = ""     # string | computed
  # signing_profile_version_arn = ""     # string | computed
  # source_code_hash            = ""     # string | computed+DEPRECATED
  # source_code_size            = 0      # number | computed

}

