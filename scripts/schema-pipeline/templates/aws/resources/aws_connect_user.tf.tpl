# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_user                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_user" "this" {

  instance_id          = ""     # string | required
  name                 = ""     # string | required
  routing_profile_id   = ""     # string | required
  security_profile_ids = []     # set(string) | required
  directory_user_id    = ""     # string | optional+computed
  hierarchy_group_id   = ""     # string | optional
  id                   = ""     # string | optional+computed
  password             = ""     # string | optional+sensitive
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # user_id              = ""     # string | computed

  identity_info { # list [0..1]
    email           = ""     # string | optional
    first_name      = ""     # string | optional
    last_name       = ""     # string | optional
    secondary_email = ""     # string | optional

  }

  phone_config { # list [1..1]
    phone_type                    = ""     # string | required
    after_contact_work_time_limit = 0      # number | optional
    auto_accept                   = false  # bool | optional
    desk_phone_number             = ""     # string | optional

  }

}

