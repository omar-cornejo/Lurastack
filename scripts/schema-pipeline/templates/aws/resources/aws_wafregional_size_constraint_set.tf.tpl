# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafregional_size_constraint_set                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafregional_size_constraint_set" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arn  = ""     # string | computed

  size_constraints { # set
    comparison_operator = ""     # string | required
    size                = 0      # number | required
    text_transformation = ""     # string | required

    field_to_match { # list [1..1]
      type = ""     # string | required
      data = ""     # string | optional

    }

  }

}

