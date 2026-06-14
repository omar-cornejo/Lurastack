# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_partner                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_partner" "this" {

  account_id         = ""     # string | required
  cluster_identifier = ""     # string | required
  database_name      = ""     # string | required
  partner_name       = ""     # string | required
  id                 = ""     # string | optional+computed

  # status             = ""     # string | computed
  # status_message     = ""     # string | computed

}

