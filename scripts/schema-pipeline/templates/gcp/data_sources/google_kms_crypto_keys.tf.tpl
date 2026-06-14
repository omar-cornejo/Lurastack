# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_crypto_keys                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_crypto_keys" "this" {

  key_ring = ""     # string | required | The key ring that the keys belongs to. Format: 'projects/{{p…
  filter   = ""     # string | optional |  					The filter argument is used to add a filter query para…
  id       = ""     # string | optional+computed

  # keys = [  # list(object)
  #   {
  #     crypto_key_backend = ""
  #     destroy_scheduled_duration = ""
  #     effective_labels = {}  # map(string)
  #     id = ""
  #     import_only = false
  #     key_ring = ""
  #     labels = {}  # map(string)
  #     name = ""
  #     primary = [  # list(object)
  #       {
  #         name = ""
  #         state = ""
  #       }
  #     ]
  #     purpose = ""
  #     rotation_period = ""
  #     skip_initial_version_creation = false
  #     terraform_labels = {}  # map(string)
  #     version_template = [  # list(object)
  #       {
  #         algorithm = ""
  #         protection_level = ""
  #       }
  #     ]
  #   }
  # ]

}

