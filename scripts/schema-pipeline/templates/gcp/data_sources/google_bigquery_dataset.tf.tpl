# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_bigquery_dataset                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_bigquery_dataset" "this" {

  dataset_id                       = ""     # string | required | A unique ID for this dataset, without the project name. The …
  id                               = ""     # string | optional+computed
  project                          = ""     # string | optional

  # access = [  # set(object)
  #   {
  #     dataset = [  # list(object)
  #       {
  #         dataset = [  # list(object)
  #           {
  #             dataset_id = ""
  #             project_id = ""
  #           }
  #         ]
  #         target_types = []  # list(string)
  #       }
  #     ]
  #     domain = ""
  #     group_by_email = ""
  #     iam_member = ""
  #     role = ""
  #     routine = [  # list(object)
  #       {
  #         dataset_id = ""
  #         project_id = ""
  #         routine_id = ""
  #       }
  #     ]
  #     special_group = ""
  #     user_by_email = ""
  #     view = [  # list(object)
  #       {
  #         dataset_id = ""
  #         project_id = ""
  #         table_id = ""
  #       }
  #     ]
  #   }
  # ]
  # creation_time                    = 0      # number | computed | The time when this dataset was created, in milliseconds sinc…
  # default_collation                = ""     # string | computed | Defines the default collation specification of future tables…
  # default_encryption_configuration = [  # list(object)
  #   {
  #     kms_key_name = ""
  #   }
  # ]
  # default_partition_expiration_ms  = 0      # number | computed | The default partition expiration for all partitioned tables …
  # default_table_expiration_ms      = 0      # number | computed | The default lifetime of all tables in the dataset, in millis…
  # delete_contents_on_destroy       = false  # bool | computed | If set to 'true', delete all the tables in the dataset when …
  # description                      = ""     # string | computed | A user-friendly description of the dataset
  # effective_labels                 = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                             = ""     # string | computed | A hash of the resource.
  # external_dataset_reference = [  # list(object)
  #   {
  #     connection = ""
  #     external_source = ""
  #   }
  # ]
  # friendly_name                    = ""     # string | computed | A descriptive name for the dataset
  # is_case_insensitive              = false  # bool | computed | TRUE if the dataset and its table names are case-insensitive…
  # labels                           = {}     # map(string) | computed | The labels associated with this dataset. You can use these t…
  # last_modified_time               = 0      # number | computed | The date when this dataset or any of its tables was last mod…
  # location                         = ""     # string | computed | The geographic location where the dataset should reside. See…
  # max_time_travel_hours            = ""     # string | computed | Defines the time travel window in hours. The value can be fr…
  # resource_tags                    = {}     # map(string) | computed | The tags attached to this table. Tag keys are globally uniqu…
  # self_link                        = ""     # string | computed
  # storage_billing_model            = ""     # string | computed | Specifies the storage billing model for the dataset. Set thi…
  # terraform_labels                 = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

}

