# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_routing_profile                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_routing_profile" "this" {

  instance_id               = ""     # string | required
  id                        = ""     # string | optional+computed
  name                      = ""     # string | optional+computed
  routing_profile_id        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # default_outbound_queue_id = ""     # string | computed
  # description               = ""     # string | computed
  # media_concurrencies = [  # set(object)
  #   {
  #     channel = ""
  #     concurrency = 0
  #   }
  # ]
  # queue_configs = [  # set(object)
  #   {
  #     channel = ""
  #     delay = 0
  #     priority = 0
  #     queue_arn = ""
  #     queue_id = ""
  #     queue_name = ""
  #   }
  # ]

}

