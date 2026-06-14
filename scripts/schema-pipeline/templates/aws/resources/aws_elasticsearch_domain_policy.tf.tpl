# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticsearch_domain_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticsearch_domain_policy" "this" {

  access_policies = ""     # string | required
  domain_name     = ""     # string | required
  id              = ""     # string | optional+computed

  timeouts { # single
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

