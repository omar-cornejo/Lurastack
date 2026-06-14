# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ebs_snapshot_ids                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ebs_snapshot_ids" "this" {

  id                     = ""     # string | optional+computed
  owners                 = []     # list(string) | optional
  restorable_by_user_ids = []     # list(string) | optional

  # ids                    = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

