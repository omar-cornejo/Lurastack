# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmincidents_response_plan                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmincidents_response_plan" "this" {

  arn               = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # action = [  # list(object)
  #   {
  #     ssm_automation = [  # list(object)
  #       {
  #         document_name = ""
  #         document_version = ""
  #         dynamic_parameters = {}  # map(string)
  #         parameter = [  # set(object)
  #           {
  #             name = ""
  #             values = []  # set(string)
  #           }
  #         ]
  #         role_arn = ""
  #         target_account = ""
  #       }
  #     ]
  #   }
  # ]
  # chat_channel      = []     # set(string) | computed
  # display_name      = ""     # string | computed
  # engagements       = []     # set(string) | computed
  # incident_template = [  # list(object)
  #   {
  #     dedupe_string = ""
  #     impact = 0
  #     incident_tags = {}  # map(string)
  #     notification_target = [  # set(object)
  #       {
  #         sns_topic_arn = ""
  #       }
  #     ]
  #     summary = ""
  #     title = ""
  #   }
  # ]
  # integration = [  # list(object)
  #   {
  #     pagerduty = [  # list(object)
  #       {
  #         name = ""
  #         secret_id = ""
  #         service_id = ""
  #       }
  #     ]
  #   }
  # ]
  # name              = ""     # string | computed

}

