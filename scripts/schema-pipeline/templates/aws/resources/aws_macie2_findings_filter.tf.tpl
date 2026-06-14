# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_findings_filter                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_findings_filter" "this" {

  action      = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed
  position    = 0      # number | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  finding_criteria { # list [1..1]

    criterion { # set
      field          = ""     # string | required
      eq             = []     # set(string) | optional
      eq_exact_match = []     # set(string) | optional
      gt             = ""     # string | optional
      gte            = ""     # string | optional
      lt             = ""     # string | optional
      lte            = ""     # string | optional
      neq            = []     # set(string) | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

