# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_traffic_mirror_target                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_traffic_mirror_target" "this" {

  description                       = ""     # string | optional
  gateway_load_balancer_endpoint_id = ""     # string | optional
  id                                = ""     # string | optional+computed
  network_interface_id              = ""     # string | optional
  network_load_balancer_arn         = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # owner_id                          = ""     # string | computed

}

