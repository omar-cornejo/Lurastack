# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_encryption_by_default                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_encryption_by_default" "this" {

  id      = ""     # string | optional+computed

  # enabled = false  # bool | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

