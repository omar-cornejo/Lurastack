# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sesv2_dedicated_ip_pool                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_sesv2_dedicated_ip_pool" "this" {

  pool_name     = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # dedicated_ips = [  # list(object)
  #   {
  #     ip = ""
  #     warmup_percentage = 0
  #     warmup_status = ""
  #   }
  # ]
  # scaling_mode  = ""     # string | computed

}

