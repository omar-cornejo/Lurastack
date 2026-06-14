# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeartifact_domain                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeartifact_domain" "this" {

  domain           = ""     # string | required
  encryption_key   = ""     # string | optional+computed
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # asset_size_bytes = ""     # string | computed
  # created_time     = ""     # string | computed
  # owner            = ""     # string | computed
  # repository_count = 0      # number | computed
  # s3_bucket_arn    = ""     # string | computed

}

