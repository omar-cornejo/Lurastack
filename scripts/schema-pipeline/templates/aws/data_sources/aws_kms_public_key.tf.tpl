# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_public_key                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_public_key" "this" {

  key_id                   = ""     # string | required
  grant_tokens             = []     # list(string) | optional
  id                       = ""     # string | optional+computed

  # arn                      = ""     # string | computed
  # customer_master_key_spec = ""     # string | computed
  # encryption_algorithms    = []     # list(string) | computed
  # key_usage                = ""     # string | computed
  # public_key               = ""     # string | computed
  # public_key_pem           = ""     # string | computed
  # signing_algorithms       = []     # list(string) | computed

}

