# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_globalaccelerator_custom_routing_accelerator        │
# └──────────────────────────────────────────────────────────────┘
data "aws_globalaccelerator_custom_routing_accelerator" "this" {

  arn             = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  name            = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # attributes = [  # list(object)
  #   {
  #     flow_logs_enabled = false
  #     flow_logs_s3_bucket = ""
  #     flow_logs_s3_prefix = ""
  #   }
  # ]
  # dns_name        = ""     # string | computed
  # enabled         = false  # bool | computed
  # hosted_zone_id  = ""     # string | computed
  # ip_address_type = ""     # string | computed
  # ip_sets = [  # list(object)
  #   {
  #     ip_addresses = []  # list(string)
  #     ip_family = ""
  #   }
  # ]

}

