# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_restore_testing_plan                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_restore_testing_plan" "this" {

  name                         = ""     # string | required
  schedule_expression          = ""     # string | required
  schedule_expression_timezone = ""     # string | optional+computed
  start_window_hours           = 0      # number | optional+computed
  tags                         = {}     # map(string) | optional

  # arn                          = ""     # string | computed
  # tags_all                     = {}     # map(string) | computed

  recovery_point_selection { # list
    algorithm             = ""     # string | required
    include_vaults        = []     # set(string) | required
    recovery_point_types  = []     # set(string) | required
    exclude_vaults        = []     # set(string) | optional+computed
    selection_window_days = 0      # number | optional+computed

  }

}

