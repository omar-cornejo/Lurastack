# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_controltower_controls                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_controltower_controls" "this" {

  target_identifier = ""     # string | required
  id                = ""     # string | optional+computed

  # enabled_controls  = []     # list(string) | computed

}

