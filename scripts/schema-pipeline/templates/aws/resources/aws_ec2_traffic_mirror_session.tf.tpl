# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_traffic_mirror_session                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_traffic_mirror_session" "this" {

  network_interface_id     = ""     # string | required
  session_number           = 0      # number | required
  traffic_mirror_filter_id = ""     # string | required
  traffic_mirror_target_id = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  packet_length            = 0      # number | optional+computed
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  virtual_network_id       = 0      # number | optional+computed

  # arn                      = ""     # string | computed
  # owner_id                 = ""     # string | computed

}

