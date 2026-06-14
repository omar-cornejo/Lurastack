# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_service_private_dns_verification   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_service_private_dns_verification" "this" {

  service_id            = ""     # string | required
  wait_for_verification = false  # bool | optional

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

