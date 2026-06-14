# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_lifecycle_policy_document                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_lifecycle_policy_document" "this" {


  # json = ""     # string | computed

  rule { # list
    priority    = 0      # number | required
    description = ""     # string | optional

    action { # list
      type = ""     # string | required

    }

    selection { # list
      count_number     = 0      # number | required
      count_type       = ""     # string | required
      tag_status       = ""     # string | required
      count_unit       = ""     # string | optional
      tag_pattern_list = []     # list(string) | optional
      tag_prefix_list  = []     # list(string) | optional

    }

  }

}

