# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_vpc_ingress_connection                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_vpc_ingress_connection" "this" {

  name        = ""     # string | required
  service_arn = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # domain_name = ""     # string | computed
  # status      = ""     # string | computed

  ingress_vpc_configuration { # list [1..1]
    vpc_endpoint_id = ""     # string | optional
    vpc_id          = ""     # string | optional

  }

}

