# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_routing_profile                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_routing_profile" "this" {

  default_outbound_queue_id = ""     # string | required
  description               = ""     # string | required
  instance_id               = ""     # string | required
  name                      = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # routing_profile_id        = ""     # string | computed

  media_concurrencies { # set [1..*]
    channel     = ""     # string | required
    concurrency = 0      # number | required

  }

  queue_configs { # set
    channel    = ""     # string | required
    delay      = 0      # number | required
    priority   = 0      # number | required
    queue_id   = ""     # string | required

    # queue_arn  = ""     # string | computed
    # queue_name = ""     # string | computed

  }

}

