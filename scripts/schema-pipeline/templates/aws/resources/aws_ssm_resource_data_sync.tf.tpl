# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_resource_data_sync                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_resource_data_sync" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  s3_destination { # list [1..1]
    bucket_name = ""     # string | required
    region      = ""     # string | required
    kms_key_arn = ""     # string | optional
    prefix      = ""     # string | optional
    sync_format = ""     # string | optional

  }

}

