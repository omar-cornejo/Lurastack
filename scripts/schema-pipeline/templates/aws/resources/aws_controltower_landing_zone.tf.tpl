# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_controltower_landing_zone                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_controltower_landing_zone" "this" {

  manifest_json            = ""     # string | required
  version                  = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # drift_status = [  # list(object)
  #   {
  #     status = ""
  #   }
  # ]
  # latest_available_version = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

