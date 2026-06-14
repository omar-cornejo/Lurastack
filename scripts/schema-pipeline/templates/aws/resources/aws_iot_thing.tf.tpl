# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_thing                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_thing" "this" {

  name              = ""     # string | required
  attributes        = {}     # map(string) | optional
  id                = ""     # string | optional+computed
  thing_type_name   = ""     # string | optional

  # arn               = ""     # string | computed
  # default_client_id = ""     # string | computed
  # version           = 0      # number | computed

}

