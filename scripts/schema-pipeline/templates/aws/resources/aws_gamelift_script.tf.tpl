# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_script                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_script" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed
  version  = ""     # string | optional
  zip_file = ""     # string | optional

  # arn      = ""     # string | computed

  storage_location { # list [0..1]
    bucket         = ""     # string | required
    key            = ""     # string | required
    role_arn       = ""     # string | required
    object_version = ""     # string | optional

  }

}

