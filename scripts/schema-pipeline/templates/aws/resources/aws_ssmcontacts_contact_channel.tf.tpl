# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmcontacts_contact_channel                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmcontacts_contact_channel" "this" {

  contact_id        = ""     # string | required
  name              = ""     # string | required
  type              = ""     # string | required
  id                = ""     # string | optional+computed

  # activation_status = ""     # string | computed
  # arn               = ""     # string | computed

  delivery_address { # list [1..1]
    simple_address = ""     # string | required

  }

}

