# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sfn_state_machine_versions                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_sfn_state_machine_versions" "this" {

  statemachine_arn      = ""     # string | required
  id                    = ""     # string | optional+computed

  # statemachine_versions = []     # list(string) | computed

}

