# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_glue_catalog_table                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_glue_catalog_table" "this" {

  database_name      = ""     # string | required
  name               = ""     # string | required
  catalog_id         = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  query_as_of_time   = ""     # string | optional
  transaction_id     = 0      # number | optional

  # arn                = ""     # string | computed
  # description        = ""     # string | computed
  # owner              = ""     # string | computed
  # parameters         = {}     # map(string) | computed
  # partition_index = [  # list(object)
  #   {
  #     index_name = ""
  #     index_status = ""
  #     keys = []  # list(string)
  #   }
  # ]
  # partition_keys = [  # list(object)
  #   {
  #     comment = ""
  #     name = ""
  #     type = ""
  #   }
  # ]
  # retention          = 0      # number | computed
  # storage_descriptor = [  # list(object)
  #   {
  #     additional_locations = []  # list(string)
  #     bucket_columns = []  # list(string)
  #     columns = [  # list(object)
  #       {
  #         comment = ""
  #         name = ""
  #         parameters = {}  # map(string)
  #         type = ""
  #       }
  #     ]
  #     compressed = false
  #     input_format = ""
  #     location = ""
  #     number_of_buckets = 0
  #     output_format = ""
  #     parameters = {}  # map(string)
  #     schema_reference = [  # list(object)
  #       {
  #         schema_id = [  # list(object)
  #           {
  #             registry_name = ""
  #             schema_arn = ""
  #             schema_name = ""
  #           }
  #         ]
  #         schema_version_id = ""
  #         schema_version_number = 0
  #       }
  #     ]
  #     ser_de_info = [  # list(object)
  #       {
  #         name = ""
  #         parameters = {}  # map(string)
  #         serialization_library = ""
  #       }
  #     ]
  #     skewed_info = [  # list(object)
  #       {
  #         skewed_column_names = []  # list(string)
  #         skewed_column_value_location_maps = {}  # map(string)
  #         skewed_column_values = []  # list(string)
  #       }
  #     ]
  #     sort_columns = [  # list(object)
  #       {
  #         column = ""
  #         sort_order = 0
  #       }
  #     ]
  #     stored_as_sub_directories = false
  #   }
  # ]
  # table_type         = ""     # string | computed
  # target_table = [  # list(object)
  #   {
  #     catalog_id = ""
  #     database_name = ""
  #     name = ""
  #     region = ""
  #   }
  # ]
  # view_expanded_text = ""     # string | computed
  # view_original_text = ""     # string | computed

}

