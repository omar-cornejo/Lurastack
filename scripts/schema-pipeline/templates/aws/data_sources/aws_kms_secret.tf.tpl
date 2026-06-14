# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_secret                                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_secret" "this" {

  id = ""     # string | optional+computed

  secret { # set [1..*]
    name         = ""     # string | required
    payload      = ""     # string | required
    context      = {}     # map(string) | optional
    grant_tokens = []     # list(string) | optional

  }

}

