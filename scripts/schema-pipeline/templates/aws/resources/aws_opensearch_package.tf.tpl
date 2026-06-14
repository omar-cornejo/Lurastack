# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_package                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_package" "this" {

  package_name              = ""     # string | required
  package_type              = ""     # string | required
  id                        = ""     # string | optional+computed
  package_description       = ""     # string | optional

  # available_package_version = ""     # string | computed
  # package_id                = ""     # string | computed

  package_source { # list [1..1]
    s3_bucket_name = ""     # string | required
    s3_key         = ""     # string | required

  }

}

