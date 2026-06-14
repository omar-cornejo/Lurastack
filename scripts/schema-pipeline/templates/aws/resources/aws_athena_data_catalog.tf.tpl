# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_data_catalog                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_data_catalog" "this" {

  description = ""     # string | required
  name        = ""     # string | required
  parameters  = {}     # map(string) | required
  type        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}

