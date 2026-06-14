# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_fast_snapshot_restore                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_fast_snapshot_restore" "this" {

  availability_zone = ""     # string | required
  snapshot_id       = ""     # string | required

  # id                = ""     # string | computed
  # state             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

