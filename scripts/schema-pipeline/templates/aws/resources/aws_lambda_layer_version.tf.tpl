# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_layer_version                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_layer_version" "this" {

  layer_name                  = ""     # string | required
  compatible_architectures    = []     # set(string) | optional
  compatible_runtimes         = []     # set(string) | optional
  description                 = ""     # string | optional
  filename                    = ""     # string | optional
  id                          = ""     # string | optional+computed
  license_info                = ""     # string | optional
  s3_bucket                   = ""     # string | optional
  s3_key                      = ""     # string | optional
  s3_object_version           = ""     # string | optional
  skip_destroy                = false  # bool | optional
  source_code_hash            = ""     # string | optional+computed

  # arn                         = ""     # string | computed
  # code_sha256                 = ""     # string | computed
  # created_date                = ""     # string | computed
  # layer_arn                   = ""     # string | computed
  # signing_job_arn             = ""     # string | computed
  # signing_profile_version_arn = ""     # string | computed
  # source_code_size            = 0      # number | computed
  # version                     = ""     # string | computed

}

