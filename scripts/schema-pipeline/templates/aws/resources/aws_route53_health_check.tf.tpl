# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_health_check                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_health_check" "this" {

  type                            = ""     # string | required
  child_health_threshold          = 0      # number | optional
  child_healthchecks              = []     # set(string) | optional
  cloudwatch_alarm_name           = ""     # string | optional
  cloudwatch_alarm_region         = ""     # string | optional
  disabled                        = false  # bool | optional
  enable_sni                      = false  # bool | optional+computed
  failure_threshold               = 0      # number | optional+computed
  fqdn                            = ""     # string | optional
  id                              = ""     # string | optional+computed
  insufficient_data_health_status = ""     # string | optional
  invert_healthcheck              = false  # bool | optional
  ip_address                      = ""     # string | optional
  measure_latency                 = false  # bool | optional
  port                            = 0      # number | optional
  reference_name                  = ""     # string | optional
  regions                         = []     # set(string) | optional
  request_interval                = 0      # number | optional
  resource_path                   = ""     # string | optional
  routing_control_arn             = ""     # string | optional
  search_string                   = ""     # string | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  triggers                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed

}

