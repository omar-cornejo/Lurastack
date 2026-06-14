# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kendra_index                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kendra_index" "this" {

  name                = ""     # string | required
  role_arn            = ""     # string | required
  description         = ""     # string | optional
  edition             = ""     # string | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  user_context_policy = ""     # string | optional

  # arn                 = ""     # string | computed
  # created_at          = ""     # string | computed
  # error_message       = ""     # string | computed
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
  # status              = ""     # string | computed
  # updated_at          = ""     # string | computed

  capacity_units { # list [0..1]
    query_capacity_units   = 0      # number | optional+computed
    storage_capacity_units = 0      # number | optional+computed

  }

  document_metadata_configuration_updates { # set [0..500]
    name = ""     # string | required
    type = ""     # string | required

    relevance { # list [0..1]
      duration              = ""     # string | optional+computed
      freshness             = false  # bool | optional+computed
      importance            = 0      # number | optional+computed
      rank_order            = ""     # string | optional+computed
      values_importance_map = {}     # map(number) | optional+computed

    }

    search { # list [0..1]
      displayable = false  # bool | optional+computed
      facetable   = false  # bool | optional+computed
      searchable  = false  # bool | optional+computed
      sortable    = false  # bool | optional+computed

    }

  }

  server_side_encryption_configuration { # list [0..1]
    kms_key_id = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  user_group_resolution_configuration { # list [0..1]
    user_group_resolution_mode = ""     # string | required

  }

  user_token_configurations { # list [0..1]

    json_token_type_configuration { # list [0..1]
      group_attribute_field     = ""     # string | required
      user_name_attribute_field = ""     # string | required

    }

    jwt_token_type_configuration { # list [0..1]
      key_location              = ""     # string | required
      claim_regex               = ""     # string | optional
      group_attribute_field     = ""     # string | optional
      issuer                    = ""     # string | optional
      secrets_manager_arn       = ""     # string | optional
      url                       = ""     # string | optional
      user_name_attribute_field = ""     # string | optional

    }

  }

}

