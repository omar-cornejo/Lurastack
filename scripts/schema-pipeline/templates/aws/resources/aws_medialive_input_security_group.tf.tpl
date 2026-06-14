# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_medialive_input_security_group                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_medialive_input_security_group" "this" {

  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # inputs   = []     # list(string) | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  whitelist_rules { # set [1..*]
    cidr = ""     # string | required

  }

}

