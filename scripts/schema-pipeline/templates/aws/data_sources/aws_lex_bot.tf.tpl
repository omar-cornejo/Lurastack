# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lex_bot                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_lex_bot" "this" {

  name                            = ""     # string | required
  id                              = ""     # string | optional+computed
  version                         = ""     # string | optional

  # arn                             = ""     # string | computed
  # checksum                        = ""     # string | computed
  # child_directed                  = false  # bool | computed
  # created_date                    = ""     # string | computed
  # description                     = ""     # string | computed
  # detect_sentiment                = false  # bool | computed
  # enable_model_improvements       = false  # bool | computed
  # failure_reason                  = ""     # string | computed
  # idle_session_ttl_in_seconds     = 0      # number | computed
  # last_updated_date               = ""     # string | computed
  # locale                          = ""     # string | computed
  # nlu_intent_confidence_threshold = 0      # number | computed
  # status                          = ""     # string | computed
  # voice_id                        = ""     # string | computed

}

