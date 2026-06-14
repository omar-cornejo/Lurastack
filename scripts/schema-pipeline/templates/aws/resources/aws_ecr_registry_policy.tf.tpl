# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_registry_policy                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_registry_policy" "this" {

  policy      = ""     # string | required
  id          = ""     # string | optional+computed

  # registry_id = ""     # string | computed

}

