# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector_assessment_target                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector_assessment_target" "this" {

  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  resource_group_arn = ""     # string | optional

  # arn                = ""     # string | computed

}

