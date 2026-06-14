# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_termination               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_termination" "this" {

  calling_regions      = []     # set(string) | required
  cidr_allow_list      = []     # set(string) | required
  voice_connector_id   = ""     # string | required
  cps_limit            = 0      # number | optional
  default_phone_number = ""     # string | optional
  disabled             = false  # bool | optional
  id                   = ""     # string | optional+computed

}

