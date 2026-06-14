# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_topic_subscription                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_topic_subscription" "this" {

  endpoint                        = ""     # string | required
  protocol                        = ""     # string | required
  topic_arn                       = ""     # string | required
  confirmation_timeout_in_minutes = 0      # number | optional
  delivery_policy                 = ""     # string | optional
  endpoint_auto_confirms          = false  # bool | optional
  filter_policy                   = ""     # string | optional
  filter_policy_scope             = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  raw_message_delivery            = false  # bool | optional
  redrive_policy                  = ""     # string | optional
  replay_policy                   = ""     # string | optional
  subscription_role_arn           = ""     # string | optional

  # arn                             = ""     # string | computed
  # confirmation_was_authenticated  = false  # bool | computed
  # owner_id                        = ""     # string | computed
  # pending_confirmation            = false  # bool | computed

}

