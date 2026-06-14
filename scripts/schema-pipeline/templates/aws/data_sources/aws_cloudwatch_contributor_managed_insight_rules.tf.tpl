# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_contributor_managed_insight_rules        │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_contributor_managed_insight_rules" "this" {

  resource_arn  = ""     # string | required

  # managed_rules = [  # list(object)
  #   {
  #     resource_arn = ""
  #     rule_state = [  # list(object)
  #       {
  #         rule_name = ""
  #         state = ""
  #       }
  #     ]
  #     template_name = ""
  #   }
  # ]

}

