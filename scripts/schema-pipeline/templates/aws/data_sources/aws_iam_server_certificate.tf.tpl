# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_server_certificate                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_server_certificate" "this" {

  id                = ""     # string | optional+computed
  latest            = false  # bool | optional
  name              = ""     # string | optional+computed
  name_prefix       = ""     # string | optional
  path_prefix       = ""     # string | optional

  # arn               = ""     # string | computed
  # certificate_body  = ""     # string | computed
  # certificate_chain = ""     # string | computed
  # expiration_date   = ""     # string | computed
  # path              = ""     # string | computed
  # upload_date       = ""     # string | computed

}

