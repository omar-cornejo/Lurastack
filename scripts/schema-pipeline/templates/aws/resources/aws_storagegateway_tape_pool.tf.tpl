# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_tape_pool                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_tape_pool" "this" {

  pool_name                   = ""     # string | required
  storage_class               = ""     # string | required
  id                          = ""     # string | optional+computed
  retention_lock_time_in_days = 0      # number | optional
  retention_lock_type         = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed

}

