# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_knowledge_base                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_knowledge_base" "this" {

  name            = ""     # string | required
  role_arn        = ""     # string | required
  description     = ""     # string | optional
  tags            = {}     # map(string) | optional

  # arn             = ""     # string | computed
  # created_at      = ""     # string | computed
  # failure_reasons = []     # list(string) | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed
  # updated_at      = ""     # string | computed

  knowledge_base_configuration { # list
    type = ""     # string | required

    vector_knowledge_base_configuration { # list
      embedding_model_arn = ""     # string | required

      embedding_model_configuration { # list

        bedrock_embedding_model_configuration { # list
          dimensions          = 0      # number | optional
          embedding_data_type = ""     # string | optional

        }

      }

      supplemental_data_storage_configuration { # list

        storage_location { # list
          type = ""     # string | required

          s3_location { # list
            uri = ""     # string | required

          }

        }

      }

    }

  }

  storage_configuration { # list
    type = ""     # string | required

    opensearch_serverless_configuration { # list
      collection_arn    = ""     # string | required
      vector_index_name = ""     # string | required

      field_mapping { # list
        metadata_field = ""     # string | optional
        text_field     = ""     # string | optional
        vector_field   = ""     # string | optional

      }

    }

    pinecone_configuration { # list
      connection_string      = ""     # string | required
      credentials_secret_arn = ""     # string | required
      namespace              = ""     # string | optional

      field_mapping { # list
        metadata_field = ""     # string | optional
        text_field     = ""     # string | optional

      }

    }

    rds_configuration { # list
      credentials_secret_arn = ""     # string | required
      database_name          = ""     # string | required
      resource_arn           = ""     # string | required
      table_name             = ""     # string | required

      field_mapping { # list
        metadata_field    = ""     # string | required
        primary_key_field = ""     # string | required
        text_field        = ""     # string | required
        vector_field      = ""     # string | required

      }

    }

    redis_enterprise_cloud_configuration { # list
      credentials_secret_arn = ""     # string | required
      endpoint               = ""     # string | required
      vector_index_name      = ""     # string | required

      field_mapping { # list
        metadata_field = ""     # string | optional
        text_field     = ""     # string | optional
        vector_field   = ""     # string | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

