# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_service_discovery_service                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_service_discovery_service" "this" {

  name                       = ""     # string | required
  namespace_id               = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed+DEPRECATED

  # arn                        = ""     # string | computed
  # description                = ""     # string | computed
  # dns_config = [  # list(object)
  #   {
  #     dns_records = [  # list(object)
  #       {
  #         ttl = 0
  #         type = ""
  #       }
  #     ]
  #     namespace_id = ""
  #     routing_policy = ""
  #   }
  # ]
  # health_check_config = [  # list(object)
  #   {
  #     failure_threshold = 0
  #     resource_path = ""
  #     type = ""
  #   }
  # ]
  # health_check_custom_config = [  # list(object)
  #   {
  #     failure_threshold = 0
  #   }
  # ]

}

