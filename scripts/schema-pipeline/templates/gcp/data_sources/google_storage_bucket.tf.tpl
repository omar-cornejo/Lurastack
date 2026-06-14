# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_bucket                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_bucket" "this" {

  name                        = ""     # string | required | The name of the bucket.
  id                          = ""     # string | optional+computed
  project                     = ""     # string | optional | The ID of the project in which the resource belongs. If it i…

  # autoclass = [  # list(object)
  #   {
  #     enabled = false
  #     terminal_storage_class = ""
  #   }
  # ]
  # cors = [  # list(object)
  #   {
  #     max_age_seconds = 0
  #     method = []  # list(string)
  #     origin = []  # list(string)
  #     response_header = []  # list(string)
  #   }
  # ]
  # custom_placement_config = [  # list(object)
  #   {
  #     data_locations = []  # set(string)
  #   }
  # ]
  # default_event_based_hold    = false  # bool | computed | Whether or not to automatically apply an eventBasedHold to n…
  # effective_labels            = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # enable_object_retention     = false  # bool | computed | Enables each object in the bucket to have its own retention …
  # encryption = [  # list(object)
  #   {
  #     default_kms_key_name = ""
  #   }
  # ]
  # force_destroy               = false  # bool | computed | When deleting a bucket, this boolean option will delete all …
  # labels                      = {}     # map(string) | computed | A set of key/value label pairs to assign to the bucket.
  # lifecycle_rule = [  # list(object)
  #   {
  #     action = [  # set(object)
  #       {
  #         storage_class = ""
  #         type = ""
  #       }
  #     ]
  #     condition = [  # set(object)
  #       {
  #         age = 0
  #         created_before = ""
  #         custom_time_before = ""
  #         days_since_custom_time = 0
  #         days_since_noncurrent_time = 0
  #         matches_prefix = []  # list(string)
  #         matches_storage_class = []  # list(string)
  #         matches_suffix = []  # list(string)
  #         no_age = false
  #         noncurrent_time_before = ""
  #         num_newer_versions = 0
  #         send_age_if_zero = false
  #         send_days_since_custom_time_if_zero = false
  #         send_days_since_noncurrent_time_if_zero = false
  #         send_num_newer_versions_if_zero = false
  #         with_state = ""
  #       }
  #     ]
  #   }
  # ]
  # location                    = ""     # string | computed | The Google Cloud Storage location
  # logging = [  # list(object)
  #   {
  #     log_bucket = ""
  #     log_object_prefix = ""
  #   }
  # ]
  # project_number              = 0      # number | computed | The project number of the project in which the resource belo…
  # public_access_prevention    = ""     # string | computed | Prevents public access to a bucket.
  # requester_pays              = false  # bool | computed | Enables Requester Pays on a storage bucket.
  # retention_policy = [  # list(object)
  #   {
  #     is_locked = false
  #     retention_period = 0
  #   }
  # ]
  # rpo                         = ""     # string | computed | Specifies the RPO setting of bucket. If set 'ASYNC_TURBO', T…
  # self_link                   = ""     # string | computed | The URI of the created resource.
  # soft_delete_policy = [  # list(object)
  #   {
  #     effective_time = ""
  #     retention_duration_seconds = 0
  #   }
  # ]
  # storage_class               = ""     # string | computed | The Storage Class of the new bucket. Supported values includ…
  # terraform_labels            = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uniform_bucket_level_access = false  # bool | computed | Enables uniform bucket-level access on a bucket.
  # url                         = ""     # string | computed | The base URL of the bucket, in the format gs://<bucket-name>…
  # versioning = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # website = [  # list(object)
  #   {
  #     main_page_suffix = ""
  #     not_found_page = ""
  #   }
  # ]

}

