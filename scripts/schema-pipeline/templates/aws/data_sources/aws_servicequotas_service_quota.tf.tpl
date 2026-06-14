# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicequotas_service_quota                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicequotas_service_quota" "this" {

  service_code  = ""     # string | required
  id            = ""     # string | optional+computed
  quota_code    = ""     # string | optional+computed
  quota_name    = ""     # string | optional+computed

  # adjustable    = false  # bool | computed
  # arn           = ""     # string | computed
  # default_value = 0      # number | computed
  # global_quota  = false  # bool | computed
  # service_name  = ""     # string | computed
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
  # value         = 0      # number | computed

}

