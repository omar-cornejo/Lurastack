# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecatalyst_source_repository                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecatalyst_source_repository" "this" {

  name         = ""     # string | required
  project_name = ""     # string | required
  space_name   = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

