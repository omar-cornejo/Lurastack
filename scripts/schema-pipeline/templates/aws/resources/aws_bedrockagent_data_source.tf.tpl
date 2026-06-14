# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_data_source                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_data_source" "this" {

  knowledge_base_id    = ""     # string | required
  name                 = ""     # string | required
  data_deletion_policy = ""     # string | optional+computed
  description          = ""     # string | optional

  # data_source_id       = ""     # string | computed
  # id                   = ""     # string | computed

  data_source_configuration { # list
    type = ""     # string | required

    confluence_configuration { # list

      crawler_configuration { # list

        filter_configuration { # list
          type = ""     # string | required

          pattern_object_filter { # list

            filters { # list
              object_type       = ""     # string | required
              exclusion_filters = []     # set(string) | optional
              inclusion_filters = []     # set(string) | optional

            }

          }

        }

      }

      source_configuration { # list
        auth_type              = ""     # string | required
        credentials_secret_arn = ""     # string | required
        host_type              = ""     # string | required
        host_url               = ""     # string | required

      }

    }

    s3_configuration { # list
      bucket_arn              = ""     # string | required
      bucket_owner_account_id = ""     # string | optional
      inclusion_prefixes      = []     # set(string) | optional

    }

    salesforce_configuration { # list

      crawler_configuration { # list

        filter_configuration { # list
          type = ""     # string | required

          pattern_object_filter { # list

            filters { # list
              object_type       = ""     # string | required
              exclusion_filters = []     # set(string) | optional
              inclusion_filters = []     # set(string) | optional

            }

          }

        }

      }

      source_configuration { # list
        auth_type              = ""     # string | required
        credentials_secret_arn = ""     # string | required
        host_url               = ""     # string | required

      }

    }

    share_point_configuration { # list

      crawler_configuration { # list

        filter_configuration { # list
          type = ""     # string | required

          pattern_object_filter { # list

            filters { # list
              object_type       = ""     # string | required
              exclusion_filters = []     # set(string) | optional
              inclusion_filters = []     # set(string) | optional

            }

          }

        }

      }

      source_configuration { # list
        auth_type              = ""     # string | required
        credentials_secret_arn = ""     # string | required
        domain                 = ""     # string | required
        host_type              = ""     # string | required
        site_urls              = []     # set(string) | required
        tenant_id              = ""     # string | optional

      }

    }

    web_configuration { # list

      crawler_configuration { # list
        exclusion_filters = []     # set(string) | optional
        inclusion_filters = []     # set(string) | optional
        scope             = ""     # string | optional
        user_agent        = ""     # string | optional

        crawler_limits { # list
          max_pages  = 0      # number | optional
          rate_limit = 0      # number | optional

        }

      }

      source_configuration { # list

        url_configuration { # list

          seed_urls { # list
            url = ""     # string | optional

          }

        }

      }

    }

  }

  server_side_encryption_configuration { # list
    kms_key_arn = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  vector_ingestion_configuration { # list

    chunking_configuration { # list
      chunking_strategy = ""     # string | required

      fixed_size_chunking_configuration { # list
        max_tokens         = 0      # number | required
        overlap_percentage = 0      # number | required

      }

      hierarchical_chunking_configuration { # list
        overlap_tokens = 0      # number | required

        level_configuration { # list
          max_tokens = 0      # number | required

        }

      }

      semantic_chunking_configuration { # list
        breakpoint_percentile_threshold = 0      # number | required
        buffer_size                     = 0      # number | required
        max_token                       = 0      # number | required

      }

    }

    custom_transformation_configuration { # list

      intermediate_storage { # list

        s3_location { # list
          uri = ""     # string | required

        }

      }

      transformation { # list
        step_to_apply = ""     # string | required

        transformation_function { # list

          transformation_lambda_configuration { # list
            lambda_arn = ""     # string | required

          }

        }

      }

    }

    parsing_configuration { # list
      parsing_strategy = ""     # string | required

      bedrock_foundation_model_configuration { # list
        model_arn = ""     # string | required

        parsing_prompt { # list
          parsing_prompt_string = ""     # string | required

        }

      }

    }

  }

}

