# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_platform_application                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_platform_application" "this" {

  name                             = ""     # string | required
  platform                         = ""     # string | required
  platform_credential              = ""     # string | required+sensitive
  apple_platform_bundle_id         = ""     # string | optional
  apple_platform_team_id           = ""     # string | optional
  event_delivery_failure_topic_arn = ""     # string | optional
  event_endpoint_created_topic_arn = ""     # string | optional
  event_endpoint_deleted_topic_arn = ""     # string | optional
  event_endpoint_updated_topic_arn = ""     # string | optional
  failure_feedback_role_arn        = ""     # string | optional
  id                               = ""     # string | optional+computed
  platform_principal               = ""     # string | optional+sensitive
  success_feedback_role_arn        = ""     # string | optional
  success_feedback_sample_rate     = ""     # string | optional

  # arn                              = ""     # string | computed

}

