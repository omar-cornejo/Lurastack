# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmonitor_probe                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmonitor_probe" "this" {

  destination      = ""     # string | required
  monitor_name     = ""     # string | required
  protocol         = ""     # string | required
  source_arn       = ""     # string | required
  destination_port = 0      # number | optional
  packet_size      = 0      # number | optional+computed
  tags             = {}     # map(string) | optional

  # address_family   = ""     # string | computed
  # arn              = ""     # string | computed
  # id               = ""     # string | computed
  # probe_id         = ""     # string | computed
  # tags_all         = {}     # map(string) | computed
  # vpc_id           = ""     # string | computed

}

