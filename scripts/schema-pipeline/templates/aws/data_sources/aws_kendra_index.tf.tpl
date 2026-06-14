# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kendra_index                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_kendra_index" "this" {

  id                                      = ""     # string | required
  tags                                    = {}     # map(string) | optional+computed

  # arn                                     = ""     # string | computed
  # capacity_units = [  # list(object)
  #   {
  #     query_capacity_units = 0
  #     storage_capacity_units = 0
  #   }
  # ]
  # created_at                              = ""     # string | computed
  # description                             = ""     # string | computed
  # document_metadata_configuration_updates = [  # set(object)
  #   {
  #     name = ""
  #     relevance = [  # list(object)
  #       {
  #         duration = ""
  #         freshness = false
  #         importance = 0
  #         rank_order = ""
  #         values_importance_map = {}  # map(number)
  #       }
  #     ]
  #     search = [  # list(object)
  #       {
  #         displayable = false
  #         facetable = false
  #         searchable = false
  #         sortable = false
  #       }
  #     ]
  #     type = ""
  #   }
  # ]
  # edition                                 = ""     # string | computed
  # error_message                           = ""     # string | computed
  # index_statistics = [  # list(object)
  #   {
  #     faq_statistics = [  # list(object)
  #       {
  #         indexed_question_answers_count = 0
  #       }
  #     ]
  #     text_document_statistics = [  # list(object)
  #       {
  #         indexed_text_bytes = 0
  #         indexed_text_documents_count = 0
  #       }
  #     ]
  #   }
  # ]
  # name                                    = ""     # string | computed
  # role_arn                                = ""     # string | computed
  # server_side_encryption_configuration = [  # list(object)
  #   {
  #     kms_key_id = ""
  #   }
  # ]
  # status                                  = ""     # string | computed
  # updated_at                              = ""     # string | computed
  # user_context_policy                     = ""     # string | computed
  # user_group_resolution_configuration = [  # list(object)
  #   {
  #     user_group_resolution_mode = ""
  #   }
  # ]
  # user_token_configurations = [  # list(object)
  #   {
  #     json_token_type_configuration = [  # list(object)
  #       {
  #         group_attribute_field = ""
  #         user_name_attribute_field = ""
  #       }
  #     ]
  #     jwt_token_type_configuration = [  # list(object)
  #       {
  #         claim_regex = ""
  #         group_attribute_field = ""
  #         issuer = ""
  #         key_location = ""
  #         secrets_manager_arn = ""
  #         url = ""
  #         user_name_attribute_field = ""
  #       }
  #     ]
  #   }
  # ]

}

