# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mskconnect_worker_configuration                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mskconnect_worker_configuration" "this" {

  name                    = ""     # string | required
  properties_file_content = ""     # string | required
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # latest_revision         = 0      # number | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}

