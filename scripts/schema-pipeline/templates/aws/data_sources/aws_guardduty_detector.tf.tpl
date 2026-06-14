# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_guardduty_detector                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_guardduty_detector" "this" {

  id                           = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # features = [  # list(object)
  #   {
  #     additional_configuration = [  # list(object)
  #       {
  #         name = ""
  #         status = ""
  #       }
  #     ]
  #     name = ""
  #     status = ""
  #   }
  # ]
  # finding_publishing_frequency = ""     # string | computed
  # service_role_arn             = ""     # string | computed
  # status                       = ""     # string | computed

}

