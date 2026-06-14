# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_database                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_database" "this" {

  environment_id          = ""     # string | required
  name                    = ""     # string | required
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # created_timestamp       = ""     # string | computed
  # last_modified_timestamp = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

