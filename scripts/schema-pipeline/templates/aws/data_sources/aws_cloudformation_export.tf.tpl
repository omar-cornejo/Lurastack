# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudformation_export                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudformation_export" "this" {

  name               = ""     # string | required
  id                 = ""     # string | optional+computed

  # exporting_stack_id = ""     # string | computed
  # value              = ""     # string | computed

}

