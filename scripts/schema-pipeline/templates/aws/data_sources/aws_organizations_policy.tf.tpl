# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_organizations_policy                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_organizations_policy" "this" {

  policy_id   = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # aws_managed = false  # bool | computed
  # content     = ""     # string | computed
  # description = ""     # string | computed
  # name        = ""     # string | computed
  # type        = ""     # string | computed

}

