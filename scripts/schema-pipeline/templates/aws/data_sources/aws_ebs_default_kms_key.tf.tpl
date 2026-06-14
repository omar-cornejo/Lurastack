# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_default_kms_key                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_default_kms_key" "this" {

  id      = ""     # string | optional+computed

  # key_arn = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

