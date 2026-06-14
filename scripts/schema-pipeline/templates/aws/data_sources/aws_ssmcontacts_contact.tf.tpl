# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmcontacts_contact                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmcontacts_contact" "this" {

  arn          = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional+computed

  # alias        = ""     # string | computed
  # display_name = ""     # string | computed
  # type         = ""     # string | computed

}

