# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_s3                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_s3" "this" {

  s3_bucket_arn    = ""     # string | required
  subdirectory     = ""     # string | required
  agent_arns       = []     # set(string) | optional
  id               = ""     # string | optional+computed
  s3_storage_class = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # uri              = ""     # string | computed

  s3_config { # list [1..1]
    bucket_access_role_arn = ""     # string | required

  }

}

