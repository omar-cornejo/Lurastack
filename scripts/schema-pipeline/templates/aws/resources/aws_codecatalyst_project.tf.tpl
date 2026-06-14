# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecatalyst_project                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecatalyst_project" "this" {

  display_name = ""     # string | required
  space_name   = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed

  # name         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

