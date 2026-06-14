# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoverycontrolconfig_cluster            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoverycontrolconfig_cluster" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # cluster_endpoints = [  # list(object)
  #   {
  #     endpoint = ""
  #     region = ""
  #   }
  # ]
  # status            = ""     # string | computed

}

