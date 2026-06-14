# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kendra_data_source                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kendra_data_source" "this" {

  index_id       = ""     # string | required
  name           = ""     # string | required
  type           = ""     # string | required
  description    = ""     # string | optional
  id             = ""     # string | optional+computed
  language_code  = ""     # string | optional+computed
  role_arn       = ""     # string | optional
  schedule       = ""     # string | optional
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # created_at     = ""     # string | computed
  # data_source_id = ""     # string | computed
  # error_message  = ""     # string | computed
  # status         = ""     # string | computed
  # updated_at     = ""     # string | computed

  configuration { # list [0..1]

    s3_configuration { # list [0..1] DEPRECATED
      bucket_name        = ""     # string | required
      exclusion_patterns = []     # set(string) | optional
      inclusion_patterns = []     # set(string) | optional
      inclusion_prefixes = []     # set(string) | optional

      access_control_list_configuration { # list [0..1]
        key_path = ""     # string | optional

      }

      documents_metadata_configuration { # list [0..1]
        s3_prefix = ""     # string | optional

      }

    }

    template_configuration { # list [0..1]
      template = ""     # string | required

    }

    web_crawler_configuration { # list [0..1] DEPRECATED
      crawl_depth                             = 0      # number | optional
      max_content_size_per_page_in_mega_bytes = 0      # number | optional
      max_links_per_page                      = 0      # number | optional
      max_urls_per_minute_crawl_rate          = 0      # number | optional
      url_exclusion_patterns                  = []     # set(string) | optional
      url_inclusion_patterns                  = []     # set(string) | optional

      authentication_configuration { # list [0..1]

        basic_authentication { # set [0..10]
          credentials = ""     # string | required
          host        = ""     # string | required
          port        = 0      # number | required

        }

      }

      proxy_configuration { # list [0..1]
        host        = ""     # string | required
        port        = 0      # number | required
        credentials = ""     # string | optional

      }

      urls { # list [1..1]

        seed_url_configuration { # list [0..1]
          seed_urls        = []     # set(string) | required
          web_crawler_mode = ""     # string | optional

        }

        site_maps_configuration { # list [0..1]
          site_maps = []     # set(string) | required

        }

      }

    }

  }

  custom_document_enrichment_configuration { # list [0..1]
    role_arn = ""     # string | optional

    inline_configurations { # set [0..100]
      document_content_deletion = false  # bool | optional

      condition { # list [0..1]
        condition_document_attribute_key = ""     # string | required
        operator                         = ""     # string | required

        condition_on_value { # list [0..1]
          date_value        = ""     # string | optional
          long_value        = 0      # number | optional
          string_list_value = []     # set(string) | optional
          string_value      = ""     # string | optional

        }

      }

      target { # list [0..1]
        target_document_attribute_key            = ""     # string | optional
        target_document_attribute_value_deletion = false  # bool | optional

        target_document_attribute_value { # list [0..1]
          date_value        = ""     # string | optional
          long_value        = 0      # number | optional
          string_list_value = []     # set(string) | optional
          string_value      = ""     # string | optional

        }

      }

    }

    post_extraction_hook_configuration { # list [0..1]
      lambda_arn = ""     # string | required
      s3_bucket  = ""     # string | required

      invocation_condition { # list [0..1]
        condition_document_attribute_key = ""     # string | required
        operator                         = ""     # string | required

        condition_on_value { # list [0..1]
          date_value        = ""     # string | optional
          long_value        = 0      # number | optional
          string_list_value = []     # set(string) | optional
          string_value      = ""     # string | optional

        }

      }

    }

    pre_extraction_hook_configuration { # list [0..1]
      lambda_arn = ""     # string | required
      s3_bucket  = ""     # string | required

      invocation_condition { # list [0..1]
        condition_document_attribute_key = ""     # string | required
        operator                         = ""     # string | required

        condition_on_value { # list [0..1]
          date_value        = ""     # string | optional
          long_value        = 0      # number | optional
          string_list_value = []     # set(string) | optional
          string_value      = ""     # string | optional

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

