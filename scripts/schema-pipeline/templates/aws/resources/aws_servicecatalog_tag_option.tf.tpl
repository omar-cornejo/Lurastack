# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_tag_option                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_tag_option" "this" {

  key    = ""     # string | required
  value  = ""     # string | required
  active = false  # bool | optional
  id     = ""     # string | optional+computed

  # owner  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

