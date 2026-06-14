# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_multi_region_access_point_policy      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_multi_region_access_point_policy" "this" {

  account_id  = ""     # string | optional+computed
  id          = ""     # string | optional+computed

  # established = ""     # string | computed
  # proposed    = ""     # string | computed

  details { # list [1..1]
    name   = ""     # string | required
    policy = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

