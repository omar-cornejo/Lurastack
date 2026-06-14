# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_batch_scheduling_policy                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_batch_scheduling_policy" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  fair_share_policy { # list [0..1]
    compute_reservation = 0      # number | optional
    share_decay_seconds = 0      # number | optional

    share_distribution { # set [0..500]
      share_identifier = ""     # string | required
      weight_factor    = 0      # number | optional

    }

  }

}

