# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_directory_bucket_access_point_scope   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_directory_bucket_access_point_scope" "this" {

  account_id = ""     # string | required
  name       = ""     # string | required

  scope { # list
    permissions = []     # list(string) | optional
    prefixes    = []     # list(string) | optional

  }

}

