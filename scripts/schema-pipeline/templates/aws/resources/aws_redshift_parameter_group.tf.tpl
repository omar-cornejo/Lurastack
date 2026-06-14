# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_parameter_group                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_parameter_group" "this" {

  family      = ""     # string | required
  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  parameter { # set
    name  = ""     # string | required
    value = ""     # string | required

  }

}

