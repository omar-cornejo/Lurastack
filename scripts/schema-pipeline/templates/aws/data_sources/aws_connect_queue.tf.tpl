# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_queue                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_queue" "this" {

  instance_id            = ""     # string | required
  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed
  queue_id               = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # description            = ""     # string | computed
  # hours_of_operation_id  = ""     # string | computed
  # max_contacts           = 0      # number | computed
  # outbound_caller_config = [  # list(object)
  #   {
  #     outbound_caller_id_name = ""
  #     outbound_caller_id_number_id = ""
  #     outbound_flow_id = ""
  #   }
  # ]
  # status                 = ""     # string | computed

}

