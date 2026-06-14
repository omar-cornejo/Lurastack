# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_user                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_user" "this" {

  instance_id          = ""     # string | required
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed
  user_id              = ""     # string | optional+computed

  # arn                  = ""     # string | computed
  # directory_user_id    = ""     # string | computed
  # hierarchy_group_id   = ""     # string | computed
  # identity_info = [  # list(object)
  #   {
  #     email = ""
  #     first_name = ""
  #     last_name = ""
  #     secondary_email = ""
  #   }
  # ]
  # phone_config = [  # list(object)
  #   {
  #     after_contact_work_time_limit = 0
  #     auto_accept = false
  #     desk_phone_number = ""
  #     phone_type = ""
  #   }
  # ]
  # routing_profile_id   = ""     # string | computed
  # security_profile_ids = []     # set(string) | computed

}

