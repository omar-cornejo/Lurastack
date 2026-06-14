# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_glue_registry                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_glue_registry" "this" {

  name        = ""     # string | required

  # arn         = ""     # string | computed
  # description = ""     # string | computed

}

