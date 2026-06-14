# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_mq_broker_engine_types                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_mq_broker_engine_types" "this" {

  engine_type         = ""     # string | optional
  id                  = ""     # string | optional+computed

  # broker_engine_types = [  # list(object)
  #   {
  #     engine_type = ""
  #     engine_versions = [  # list(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #   }
  # ]

}

