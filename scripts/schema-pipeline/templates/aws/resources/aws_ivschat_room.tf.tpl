# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ivschat_room                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ivschat_room" "this" {

  id                                = ""     # string | optional+computed
  logging_configuration_identifiers = []     # list(string) | optional
  maximum_message_length            = 0      # number | optional+computed
  maximum_message_rate_per_second   = 0      # number | optional+computed
  name                              = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed

  message_review_handler { # list [0..1]
    fallback_result = ""     # string | optional+computed
    uri             = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

