# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_project                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_project" "this" {

  domain_identifier   = ""     # string | required
  name                = ""     # string | required
  description         = ""     # string | optional
  glossary_terms      = []     # list(string) | optional
  skip_deletion_check = false  # bool | optional

  # created_at          = ""     # string | computed
  # created_by          = ""     # string | computed
  # failure_reasons = [  # list(object)
  #   {
  #     code = ""
  #     message = ""
  #   }
  # ]
  # id                  = ""     # string | computed
  # last_updated_at     = ""     # string | computed
  # project_status      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

