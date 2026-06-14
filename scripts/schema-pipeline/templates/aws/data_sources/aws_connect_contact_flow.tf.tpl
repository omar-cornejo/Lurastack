# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_contact_flow                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_contact_flow" "this" {

  instance_id     = ""     # string | required
  contact_flow_id = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  name            = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed
  type            = ""     # string | optional

  # arn             = ""     # string | computed
  # content         = ""     # string | computed
  # description     = ""     # string | computed

}

