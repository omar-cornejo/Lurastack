# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_proactive_engagement                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_proactive_engagement" "this" {

  enabled = false  # bool | required

  # id      = ""     # string | computed

  emergency_contact { # list
    email_address = ""     # string | required
    contact_notes = ""     # string | optional
    phone_number  = ""     # string | optional

  }

}

