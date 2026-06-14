# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_prompt                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_prompt" "this" {

  instance_id = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # prompt_id   = ""     # string | computed

}

