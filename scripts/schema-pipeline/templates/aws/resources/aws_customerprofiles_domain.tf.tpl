# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_customerprofiles_domain                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_customerprofiles_domain" "this" {

  default_expiration_days = 0      # number | required
  domain_name             = ""     # string | required
  dead_letter_queue_url   = ""     # string | optional
  default_encryption_key  = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed

  matching { # list [0..1]
    enabled = false  # bool | required

    auto_merging { # list [0..1]
      enabled                                  = false  # bool | required
      min_allowed_confidence_score_for_merging = 0      # number | optional

      conflict_resolution { # list [0..1]
        conflict_resolving_model = ""     # string | required
        source_name              = ""     # string | optional

      }

      consolidation { # list [0..1]
        matching_attributes_list = []     # list(list(string)) | required

      }

    }

    exporting_config { # list [0..1]

      s3_exporting { # list [0..1]
        s3_bucket_name = ""     # string | required
        s3_key_name    = ""     # string | optional

      }

    }

    job_schedule { # list [0..1]
      day_of_the_week = ""     # string | required
      time            = ""     # string | required

    }

  }

  rule_based_matching { # list [0..1]
    enabled                             = false  # bool | required
    max_allowed_rule_level_for_matching = 0      # number | optional
    max_allowed_rule_level_for_merging  = 0      # number | optional
    status                              = ""     # string | optional+computed

    attribute_types_selector { # list [0..1]
      attribute_matching_model = ""     # string | required
      address                  = []     # list(string) | optional
      email_address            = []     # list(string) | optional
      phone_number             = []     # list(string) | optional

    }

    conflict_resolution { # list [0..1]
      conflict_resolving_model = ""     # string | required
      source_name              = ""     # string | optional

    }

    exporting_config { # list [0..1]

      s3_exporting { # list [0..1]
        s3_bucket_name = ""     # string | required
        s3_key_name    = ""     # string | optional

      }

    }

    matching_rules { # set
      rule = []     # list(string) | required

    }

  }

}

