# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_licensemanager_received_license                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_licensemanager_received_license" "this" {

  license_arn               = ""     # string | required
  id                        = ""     # string | optional+computed

  # beneficiary               = ""     # string | computed
  # consumption_configuration = [  # list(object)
  #   {
  #     borrow_configuration = [  # list(object)
  #       {
  #         allow_early_check_in = false
  #         max_time_to_live_in_minutes = 0
  #       }
  #     ]
  #     provisional_configuration = [  # list(object)
  #       {
  #         max_time_to_live_in_minutes = 0
  #       }
  #     ]
  #     renew_type = ""
  #   }
  # ]
  # create_time               = ""     # string | computed
  # entitlements = [  # set(object)
  #   {
  #     allow_check_in = false
  #     max_count = 0
  #     name = ""
  #     overage = false
  #     unit = ""
  #     value = ""
  #   }
  # ]
  # home_region               = ""     # string | computed
  # issuer = [  # list(object)
  #   {
  #     key_fingerprint = ""
  #     name = ""
  #     sign_key = ""
  #   }
  # ]
  # license_metadata = [  # set(object)
  #   {
  #     name = ""
  #     value = ""
  #   }
  # ]
  # license_name              = ""     # string | computed
  # product_name              = ""     # string | computed
  # product_sku               = ""     # string | computed
  # received_metadata = [  # list(object)
  #   {
  #     allowed_operations = []  # set(string)
  #     received_status = ""
  #     received_status_reason = ""
  #   }
  # ]
  # status                    = ""     # string | computed
  # validity = [  # list(object)
  #   {
  #     begin = ""
  #     end = ""
  #   }
  # ]
  # version                   = ""     # string | computed

}

