# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_device_fleet                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_device_fleet" "this" {

  device_fleet_name     = ""     # string | required
  role_arn              = ""     # string | required
  description           = ""     # string | optional
  enable_iot_role_alias = false  # bool | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # iot_role_alias        = ""     # string | computed

  output_config { # list [1..1]
    s3_output_location = ""     # string | required
    kms_key_id         = ""     # string | optional

  }

}

