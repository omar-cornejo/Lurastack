# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_scaling_group                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_scaling_group" "this" {

  availability_zone_id    = ""     # string | required
  environment_id          = ""     # string | required
  host_type               = ""     # string | required
  name                    = ""     # string | required
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # clusters                = []     # list(string) | computed
  # created_timestamp       = ""     # string | computed
  # last_modified_timestamp = ""     # string | computed
  # status                  = ""     # string | computed
  # status_reason           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

