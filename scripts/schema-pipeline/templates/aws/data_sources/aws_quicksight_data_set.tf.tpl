# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_quicksight_data_set                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_quicksight_data_set" "this" {

  data_set_id                            = ""     # string | required
  aws_account_id                         = ""     # string | optional+computed
  id                                     = ""     # string | optional+computed
  tags                                   = {}     # map(string) | optional+computed
  tags_all                               = {}     # map(string) | optional+computed+DEPRECATED

  # arn                                    = ""     # string | computed
  # column_groups = [  # list(object)
  #   {
  #     geo_spatial_column_group = [  # list(object)
  #       {
  #         columns = []  # list(string)
  #         country_code = ""
  #         name = ""
  #       }
  #     ]
  #   }
  # ]
  # column_level_permission_rules = [  # list(object)
  #   {
  #     column_names = []  # list(string)
  #     principals = []  # list(string)
  #   }
  # ]
  # data_set_usage_configuration = [  # list(object)
  #   {
  #     disable_use_as_direct_query_source = false
  #     disable_use_as_imported_source = false
  #   }
  # ]
  # field_folders = [  # set(object)
  #   {
  #     columns = []  # list(string)
  #     description = ""
  #     field_folders_id = ""
  #   }
  # ]
  # import_mode                            = ""     # string | computed
  # logical_table_map = [  # set(object)
  #   {
  #     alias = ""
  #     data_transforms = [  # list(object)
  #       {
  #         cast_column_type_operation = [  # list(object)
  #           {
  #             column_name = ""
  #             format = ""
  #             new_column_type = ""
  #           }
  #         ]
  #         create_columns_operation = [  # list(object)
  #           {
  #             columns = [  # list(object)
  #               {
  #                 column_id = ""
  #                 column_name = ""
  #                 expression = ""
  #               }
  #             ]
  #           }
  #         ]
  #         filter_operation = [  # list(object)
  #           {
  #             condition_expression = ""
  #           }
  #         ]
  #         project_operation = [  # list(object)
  #           {
  #             projected_columns = []  # list(string)
  #           }
  #         ]
  #         rename_column_operation = [  # list(object)
  #           {
  #             column_name = ""
  #             new_column_name = ""
  #           }
  #         ]
  #         tag_column_operation = [  # list(object)
  #           {
  #             column_name = ""
  #             tags = [  # list(object)
  #               {
  #                 column_description = [  # list(object)
  #                   {
  #                     text = ""
  #                   }
  #                 ]
  #                 column_geographic_role = ""
  #               }
  #             ]
  #           }
  #         ]
  #         untag_column_operation = [  # list(object)
  #           {
  #             column_name = ""
  #             tag_names = []  # list(string)
  #           }
  #         ]
  #       }
  #     ]
  #     logical_table_map_id = ""
  #     source = [  # list(object)
  #       {
  #         data_set_arn = ""
  #         join_instruction = [  # list(object)
  #           {
  #             left_join_key_properties = [  # list(object)
  #               {
  #                 unique_key = false
  #               }
  #             ]
  #             left_operand = ""
  #             on_clause = ""
  #             right_join_key_properties = [  # list(object)
  #               {
  #                 unique_key = false
  #               }
  #             ]
  #             right_operand = ""
  #             type = ""
  #           }
  #         ]
  #         physical_table_id = ""
  #       }
  #     ]
  #   }
  # ]
  # name                                   = ""     # string | computed
  # permissions = [  # list(object)
  #   {
  #     actions = []  # set(string)
  #     principal = ""
  #   }
  # ]
  # physical_table_map = [  # set(object)
  #   {
  #     custom_sql = [  # list(object)
  #       {
  #         columns = [  # list(object)
  #           {
  #             name = ""
  #             type = ""
  #           }
  #         ]
  #         data_source_arn = ""
  #         name = ""
  #         sql_query = ""
  #       }
  #     ]
  #     physical_table_map_id = ""
  #     relational_table = [  # list(object)
  #       {
  #         catalog = ""
  #         data_source_arn = ""
  #         input_columns = [  # list(object)
  #           {
  #             name = ""
  #             type = ""
  #           }
  #         ]
  #         name = ""
  #         schema = ""
  #       }
  #     ]
  #     s3_source = [  # list(object)
  #       {
  #         data_source_arn = ""
  #         input_columns = [  # list(object)
  #           {
  #             name = ""
  #             type = ""
  #           }
  #         ]
  #         upload_settings = [  # list(object)
  #           {
  #             contains_header = false
  #             delimiter = ""
  #             format = ""
  #             start_from_row = 0
  #             text_qualifier = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # row_level_permission_data_set = [  # list(object)
  #   {
  #     arn = ""
  #     format_version = ""
  #     namespace = ""
  #     permission_policy = ""
  #     status = ""
  #   }
  # ]
  # row_level_permission_tag_configuration = [  # list(object)
  #   {
  #     status = ""
  #     tag_rules = [  # list(object)
  #       {
  #         column_name = ""
  #         match_all_value = ""
  #         tag_key = ""
  #         tag_multi_value_delimiter = ""
  #       }
  #     ]
  #   }
  # ]

}

