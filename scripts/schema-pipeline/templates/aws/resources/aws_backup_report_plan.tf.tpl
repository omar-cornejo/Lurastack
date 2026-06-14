# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_report_plan                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_report_plan" "this" {

  name              = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # creation_time     = ""     # string | computed
  # deployment_status = ""     # string | computed

  report_delivery_channel { # list [1..1]
    s3_bucket_name = ""     # string | required
    formats        = []     # set(string) | optional
    s3_key_prefix  = ""     # string | optional

  }

  report_setting { # list [1..1]
    report_template      = ""     # string | required
    accounts             = []     # set(string) | optional
    framework_arns       = []     # set(string) | optional
    number_of_frameworks = 0      # number | optional
    organization_units   = []     # set(string) | optional
    regions              = []     # set(string) | optional

  }

}

