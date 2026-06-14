# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_resourceexplorer2_search                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_resourceexplorer2_search" "this" {

  query_string   = ""     # string | required
  view_arn       = ""     # string | optional+computed

  # id             = ""     # string | computed
  # resource_count = [  # list(object)
  #   {
  #     complete = false
  #     total_resources = 0
  #   }
  # ]
  # resources = [  # list(object)
  #   {
  #     arn = ""
  #     last_reported_at = ""
  #     owning_account_id = ""
  #     properties = [  # list(object)
  #       {
  #         data = ""
  #         last_reported_at = ""
  #         name = ""
  #       }
  #     ]
  #     region = ""
  #     resource_type = ""
  #     service = ""
  #   }
  # ]

}

