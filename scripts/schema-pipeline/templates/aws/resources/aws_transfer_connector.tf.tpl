# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_connector                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_connector" "this" {

  access_role          = ""     # string | required
  url                  = ""     # string | required
  id                   = ""     # string | optional+computed
  logging_role         = ""     # string | optional
  security_policy_name = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # connector_id         = ""     # string | computed

  as2_config { # list [0..1]
    compression           = ""     # string | required
    encryption_algorithm  = ""     # string | required
    local_profile_id      = ""     # string | required
    mdn_response          = ""     # string | required
    partner_profile_id    = ""     # string | required
    signing_algorithm     = ""     # string | required
    mdn_signing_algorithm = ""     # string | optional
    message_subject       = ""     # string | optional

  }

  sftp_config { # list [0..1]
    trusted_host_keys = []     # set(string) | optional
    user_secret_id    = ""     # string | optional

  }

}

