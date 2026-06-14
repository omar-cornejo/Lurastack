# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_worklink_fleet                                  │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_worklink_fleet" "this" {

  name                           = ""     # string | required
  audit_stream_arn               = ""     # string | optional
  device_ca_certificate          = ""     # string | optional
  display_name                   = ""     # string | optional
  id                             = ""     # string | optional+computed
  optimize_for_end_user_location = false  # bool | optional

  # arn                            = ""     # string | computed
  # company_code                   = ""     # string | computed
  # created_time                   = ""     # string | computed
  # last_updated_time              = ""     # string | computed

  identity_provider { # list [0..1]
    saml_metadata = ""     # string | required
    type          = ""     # string | required

  }

  network { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required

  }

}

