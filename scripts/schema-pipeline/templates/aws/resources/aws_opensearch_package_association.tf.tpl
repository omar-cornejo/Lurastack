# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_package_association                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_package_association" "this" {

  domain_name    = ""     # string | required
  package_id     = ""     # string | required
  id             = ""     # string | optional+computed

  # reference_path = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

