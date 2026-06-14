# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sfn_state_machine                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_sfn_state_machine" "this" {

  name          = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # creation_date = ""     # string | computed
  # definition    = ""     # string | computed
  # description   = ""     # string | computed
  # revision_id   = ""     # string | computed
  # role_arn      = ""     # string | computed
  # status        = ""     # string | computed

}

