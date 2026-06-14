# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sfn_alias                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_sfn_alias" "this" {

  name                  = ""     # string | required
  statemachine_arn      = ""     # string | required
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed

  # arn                   = ""     # string | computed
  # creation_date         = ""     # string | computed
  # routing_configuration = [  # list(object)
  #   {
  #     state_machine_version_arn = ""
  #     weight = 0
  #   }
  # ]

}

