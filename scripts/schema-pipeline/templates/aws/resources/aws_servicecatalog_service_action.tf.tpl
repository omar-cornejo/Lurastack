# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_service_action                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_service_action" "this" {

  name            = ""     # string | required
  accept_language = ""     # string | optional
  description     = ""     # string | optional+computed
  id              = ""     # string | optional+computed

  definition { # list [1..1]
    name        = ""     # string | required
    version     = ""     # string | required
    assume_role = ""     # string | optional
    parameters  = ""     # string | optional
    type        = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

