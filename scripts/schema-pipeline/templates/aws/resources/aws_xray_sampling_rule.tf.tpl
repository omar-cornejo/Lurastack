# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_xray_sampling_rule                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_xray_sampling_rule" "this" {

  fixed_rate     = 0      # number | required
  host           = ""     # string | required
  http_method    = ""     # string | required
  priority       = 0      # number | required
  reservoir_size = 0      # number | required
  resource_arn   = ""     # string | required
  service_name   = ""     # string | required
  service_type   = ""     # string | required
  url_path       = ""     # string | required
  version        = 0      # number | required
  attributes     = {}     # map(string) | optional
  id             = ""     # string | optional+computed
  rule_name      = ""     # string | optional
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed

}

