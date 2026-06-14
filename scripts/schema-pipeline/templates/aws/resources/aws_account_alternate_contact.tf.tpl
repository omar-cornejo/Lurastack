# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_account_alternate_contact                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_account_alternate_contact" "this" {

  alternate_contact_type = ""     # string | required
  email_address          = ""     # string | required
  name                   = ""     # string | required
  phone_number           = ""     # string | required
  title                  = ""     # string | required
  account_id             = ""     # string | optional
  id                     = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

