# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector2_enabler                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector2_enabler" "this" {

  account_ids    = []     # set(string) | required
  resource_types = []     # set(string) | required
  id             = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

