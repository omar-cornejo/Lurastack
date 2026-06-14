# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_build                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_build" "this" {

  name             = ""     # string | required
  operating_system = ""     # string | required
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed
  version          = ""     # string | optional

  # arn              = ""     # string | computed

  storage_location { # list [1..1]
    bucket         = ""     # string | required
    key            = ""     # string | required
    role_arn       = ""     # string | required
    object_version = ""     # string | optional

  }

}

