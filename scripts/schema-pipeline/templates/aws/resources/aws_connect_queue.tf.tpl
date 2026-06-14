# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_queue                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_queue" "this" {

  hours_of_operation_id = ""     # string | required
  instance_id           = ""     # string | required
  name                  = ""     # string | required
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  max_contacts          = 0      # number | optional
  quick_connect_ids     = []     # set(string) | optional
  status                = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # queue_id              = ""     # string | computed

  outbound_caller_config { # list [0..1]
    outbound_caller_id_name      = ""     # string | optional
    outbound_caller_id_number_id = ""     # string | optional
    outbound_flow_id             = ""     # string | optional

  }

}

