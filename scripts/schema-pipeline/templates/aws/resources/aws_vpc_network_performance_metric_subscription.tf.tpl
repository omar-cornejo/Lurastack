# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_network_performance_metric_subscription     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_network_performance_metric_subscription" "this" {

  destination = ""     # string | required
  source      = ""     # string | required
  id          = ""     # string | optional+computed
  metric      = ""     # string | optional
  statistic   = ""     # string | optional

  # period      = ""     # string | computed

}

