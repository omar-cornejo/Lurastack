# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudsearch_domain_service_access_policy        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudsearch_domain_service_access_policy" "this" {

  access_policy = ""     # string | required
  domain_name   = ""     # string | required
  id            = ""     # string | optional+computed

  timeouts { # single
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

