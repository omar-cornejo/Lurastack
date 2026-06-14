# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicequotas_templates                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicequotas_templates" "this" {

  region = ""     # string | required

  # id     = ""     # string | computed

  templates { # list

    # global_quota = false  # bool | computed
    # quota_code   = ""     # string | computed
    # quota_name   = ""     # string | computed
    # region       = ""     # string | computed
    # service_code = ""     # string | computed
    # service_name = ""     # string | computed
    # unit         = ""     # string | computed
    # value        = 0      # number | computed

  }

}

