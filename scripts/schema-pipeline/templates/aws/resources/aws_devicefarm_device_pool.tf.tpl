# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_device_pool                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_device_pool" "this" {

  name        = ""     # string | required
  project_arn = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  max_devices = 0      # number | optional
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # type        = ""     # string | computed

  rule { # set [1..*]
    attribute = ""     # string | optional
    operator  = ""     # string | optional
    value     = ""     # string | optional

  }

}

