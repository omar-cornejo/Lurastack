# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chimesdkvoice_sip_rule                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chimesdkvoice_sip_rule" "this" {

  name          = ""     # string | required
  trigger_type  = ""     # string | required
  trigger_value = ""     # string | required
  disabled      = false  # bool | optional
  id            = ""     # string | optional+computed

  target_applications { # set [1..25]
    aws_region               = ""     # string | required
    priority                 = 0      # number | required
    sip_media_application_id = ""     # string | required

  }

}

