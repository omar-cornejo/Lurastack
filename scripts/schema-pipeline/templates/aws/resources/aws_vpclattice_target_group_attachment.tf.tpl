# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_target_group_attachment              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_target_group_attachment" "this" {

  target_group_identifier = ""     # string | required
  id                      = ""     # string | optional+computed

  target { # list [1..1]
    id   = ""     # string | required
    port = 0      # number | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

