# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_maintenance_window                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_maintenance_window" "this" {

  cutoff                     = 0      # number | required
  duration                   = 0      # number | required
  name                       = ""     # string | required
  schedule                   = ""     # string | required
  allow_unassociated_targets = false  # bool | optional
  description                = ""     # string | optional
  enabled                    = false  # bool | optional
  end_date                   = ""     # string | optional
  id                         = ""     # string | optional+computed
  schedule_offset            = 0      # number | optional
  schedule_timezone          = ""     # string | optional
  start_date                 = ""     # string | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

}

