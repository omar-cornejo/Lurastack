# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_test_grid_project                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_test_grid_project" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required

  }

}

