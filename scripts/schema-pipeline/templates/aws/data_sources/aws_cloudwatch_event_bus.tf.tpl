# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_event_bus                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_event_bus" "this" {

  name               = ""     # string | required
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # dead_letter_config = [  # list(object)
  #   {
  #     arn = ""
  #   }
  # ]
  # description        = ""     # string | computed
  # kms_key_identifier = ""     # string | computed

}

