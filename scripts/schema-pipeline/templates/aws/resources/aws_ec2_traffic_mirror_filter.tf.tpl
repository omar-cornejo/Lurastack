# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_traffic_mirror_filter                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_traffic_mirror_filter" "this" {

  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  network_services = []     # set(string) | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed

}

