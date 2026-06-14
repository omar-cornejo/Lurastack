# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmcontacts_contact                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmcontacts_contact" "this" {

  alias        = ""     # string | required
  type         = ""     # string | required
  display_name = ""     # string | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}

