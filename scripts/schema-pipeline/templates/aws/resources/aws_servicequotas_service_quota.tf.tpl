# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicequotas_service_quota                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicequotas_service_quota" "this" {

  quota_code     = ""     # string | required
  service_code   = ""     # string | required
  value          = 0      # number | required
  id             = ""     # string | optional+computed

  # adjustable     = false  # bool | computed
  # arn            = ""     # string | computed
  # default_value  = 0      # number | computed
  # quota_name     = ""     # string | computed
  # request_id     = ""     # string | computed
  # request_status = ""     # string | computed
  # service_name   = ""     # string | computed
  # usage_metric = [  # list(object)
  #   {
  #     metric_dimensions = [  # list(object)
  #       {
  #         class = ""
  #         resource = ""
  #         service = ""
  #         type = ""
  #       }
  #     ]
  #     metric_name = ""
  #     metric_namespace = ""
  #     metric_statistic_recommendation = ""
  #   }
  # ]

}

