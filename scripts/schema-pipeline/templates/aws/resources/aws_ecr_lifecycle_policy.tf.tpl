# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_lifecycle_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_lifecycle_policy" "this" {

  policy      = ""     # string | required
  repository  = ""     # string | required
  id          = ""     # string | optional+computed

  # registry_id = ""     # string | computed

}

