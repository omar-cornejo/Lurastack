# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codebuild_report_group                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codebuild_report_group" "this" {

  name           = ""     # string | required
  type           = ""     # string | required
  delete_reports = false  # bool | optional
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # created        = ""     # string | computed

  export_config { # list [1..1]
    type = ""     # string | required

    s3_destination { # list [0..1]
      bucket              = ""     # string | required
      encryption_key      = ""     # string | required
      encryption_disabled = false  # bool | optional
      packaging           = ""     # string | optional
      path                = ""     # string | optional

    }

  }

}

