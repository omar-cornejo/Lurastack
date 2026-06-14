# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_m2_application                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_m2_application" "this" {

  engine_type     = ""     # string | required
  name            = ""     # string | required
  description     = ""     # string | optional
  kms_key_id      = ""     # string | optional
  role_arn        = ""     # string | optional
  tags            = {}     # map(string) | optional

  # application_id  = ""     # string | computed
  # arn             = ""     # string | computed
  # current_version = 0      # number | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

  definition { # list
    content     = ""     # string | optional
    s3_location = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

