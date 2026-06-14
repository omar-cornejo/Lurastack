# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_filter                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_filter" "this" {

  action      = ""     # string | required
  detector_id = ""     # string | required
  name        = ""     # string | required
  rank        = 0      # number | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  finding_criteria { # list [1..1]

    criterion { # set [1..*]
      field                 = ""     # string | required
      equals                = []     # list(string) | optional
      greater_than          = ""     # string | optional
      greater_than_or_equal = ""     # string | optional
      less_than             = ""     # string | optional
      less_than_or_equal    = ""     # string | optional
      not_equals            = []     # list(string) | optional

    }

  }

}

