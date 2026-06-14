# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_conformance_pack                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_conformance_pack" "this" {

  name                   = ""     # string | required
  delivery_s3_bucket     = ""     # string | optional
  delivery_s3_key_prefix = ""     # string | optional
  id                     = ""     # string | optional+computed
  template_body          = ""     # string | optional
  template_s3_uri        = ""     # string | optional

  # arn                    = ""     # string | computed

  input_parameter { # set [0..60]
    parameter_name  = ""     # string | required
    parameter_value = ""     # string | required

  }

}

