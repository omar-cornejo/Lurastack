# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_domain                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_domain" "this" {

  domain_execution_role = ""     # string | required
  name                  = ""     # string | required
  description           = ""     # string | optional
  kms_key_identifier    = ""     # string | optional
  skip_deletion_check   = false  # bool | optional
  tags                  = {}     # map(string) | optional

  # arn                   = ""     # string | computed
  # id                    = ""     # string | computed
  # portal_url            = ""     # string | computed
  # tags_all              = {}     # map(string) | computed

  single_sign_on { # list
    type            = ""     # string | optional+computed
    user_assignment = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

