# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_network_profile                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_network_profile" "this" {

  name                    = ""     # string | required
  project_arn             = ""     # string | required
  description             = ""     # string | optional
  downlink_bandwidth_bits = 0      # number | optional
  downlink_delay_ms       = 0      # number | optional
  downlink_jitter_ms      = 0      # number | optional
  downlink_loss_percent   = 0      # number | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed
  type                    = ""     # string | optional
  uplink_bandwidth_bits   = 0      # number | optional
  uplink_delay_ms         = 0      # number | optional
  uplink_jitter_ms        = 0      # number | optional
  uplink_loss_percent     = 0      # number | optional

  # arn                     = ""     # string | computed

}

