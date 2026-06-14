# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_server_certificate                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_server_certificate" "this" {

  certificate_body  = ""     # string | required
  private_key       = ""     # string | required+sensitive
  certificate_chain = ""     # string | optional
  id                = ""     # string | optional+computed
  name              = ""     # string | optional+computed
  name_prefix       = ""     # string | optional+computed
  path              = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # expiration        = ""     # string | computed
  # upload_date       = ""     # string | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}

