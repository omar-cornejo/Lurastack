# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dns_keys                                         │
# └──────────────────────────────────────────────────────────────┘
data "google_dns_keys" "this" {

  managed_zone      = ""     # string | required
  id                = ""     # string | optional+computed
  project           = ""     # string | optional+computed

  # key_signing_keys = [  # list(object)
  #   {
  #     algorithm = ""
  #     creation_time = ""
  #     description = ""
  #     digests = [  # list(object)
  #       {
  #         digest = ""
  #         type = ""
  #       }
  #     ]
  #     ds_record = ""
  #     id = ""
  #     is_active = false
  #     key_length = 0
  #     key_tag = 0
  #     public_key = ""
  #   }
  # ]
  # zone_signing_keys = [  # list(object)
  #   {
  #     algorithm = ""
  #     creation_time = ""
  #     description = ""
  #     digests = [  # list(object)
  #       {
  #         digest = ""
  #         type = ""
  #       }
  #     ]
  #     id = ""
  #     is_active = false
  #     key_length = 0
  #     key_tag = 0
  #     public_key = ""
  #   }
  # ]

}

