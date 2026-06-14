# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acmpca_permission                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acmpca_permission" "this" {

  actions                   = []     # set(string) | required
  certificate_authority_arn = ""     # string | required
  principal                 = ""     # string | required
  id                        = ""     # string | optional+computed
  source_account            = ""     # string | optional+computed

  # policy                    = ""     # string | computed

}

