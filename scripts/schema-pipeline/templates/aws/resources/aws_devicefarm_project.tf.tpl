# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_project                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_project" "this" {

  name                        = ""     # string | required
  default_job_timeout_minutes = 0      # number | optional
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed

}

