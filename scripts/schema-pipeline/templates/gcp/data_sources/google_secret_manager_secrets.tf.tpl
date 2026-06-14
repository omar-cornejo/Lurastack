# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secret_manager_secrets                           │
# └──────────────────────────────────────────────────────────────┘
data "google_secret_manager_secrets" "this" {

  filter  = ""     # string | optional | Filter string, adhering to the rules in List-operation filte…
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # secrets = [  # list(object)
  #   {
  #     annotations = {}  # map(string)
  #     create_time = ""
  #     effective_annotations = {}  # map(string)
  #     effective_labels = {}  # map(string)
  #     expire_time = ""
  #     labels = {}  # map(string)
  #     name = ""
  #     project = ""
  #     replication = [  # list(object)
  #       {
  #         auto = [  # list(object)
  #           {
  #             customer_managed_encryption = [  # list(object)
  #               {
  #                 kms_key_name = ""
  #               }
  #             ]
  #           }
  #         ]
  #         user_managed = [  # list(object)
  #           {
  #             replicas = [  # list(object)
  #               {
  #                 customer_managed_encryption = [  # list(object)
  #                   {
  #                     kms_key_name = ""
  #                   }
  #                 ]
  #                 location = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     rotation = [  # list(object)
  #       {
  #         next_rotation_time = ""
  #         rotation_period = ""
  #       }
  #     ]
  #     secret_id = ""
  #     terraform_labels = {}  # map(string)
  #     topics = [  # list(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #     ttl = ""
  #     version_aliases = {}  # map(string)
  #     version_destroy_ttl = ""
  #   }
  # ]

}

