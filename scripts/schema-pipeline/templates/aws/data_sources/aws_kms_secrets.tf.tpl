# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_secrets                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_secrets" "this" {

  id        = ""     # string | optional+computed

  # plaintext = {}     # map(string) | computed+sensitive

  secret { # set [1..*]
    name                 = ""     # string | required
    payload              = ""     # string | required
    context              = {}     # map(string) | optional
    encryption_algorithm = ""     # string | optional
    grant_tokens         = []     # list(string) | optional
    key_id               = ""     # string | optional

  }

}

