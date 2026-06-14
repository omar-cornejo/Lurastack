# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_transfer_connector                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_transfer_connector" "this" {

  id                                  = ""     # string | required

  # access_role                         = ""     # string | computed
  # arn                                 = ""     # string | computed
  # as2_config = [  # list(object)
  #   {
  #     basic_auth_secret_id = ""
  #     compression = ""
  #     encryption_algorithm = ""
  #     local_profile_id = ""
  #     mdn_response = ""
  #     mdn_signing_algorithm = ""
  #     message_subject = ""
  #     partner_profile_id = ""
  #     singing_algorithm = ""
  #   }
  # ]
  # logging_role                        = ""     # string | computed
  # security_policy_name                = ""     # string | computed
  # service_managed_egress_ip_addresses = []     # list(string) | computed
  # sftp_config = [  # list(object)
  #   {
  #     trusted_host_keys = []  # list(string)
  #     user_secret_id = ""
  #   }
  # ]
  # tags                                = {}     # map(string) | computed
  # url                                 = ""     # string | computed

}

