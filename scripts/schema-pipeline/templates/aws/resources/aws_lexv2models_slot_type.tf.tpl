# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_slot_type                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_slot_type" "this" {

  bot_id                     = ""     # string | required
  bot_version                = ""     # string | required
  locale_id                  = ""     # string | required
  name                       = ""     # string | required
  description                = ""     # string | optional
  parent_slot_type_signature = ""     # string | optional

  # id                         = ""     # string | computed
  # slot_type_id               = ""     # string | computed

  composite_slot_type_setting { # list

    sub_slots { # list
      name         = ""     # string | required
      slot_type_id = ""     # string | required

    }

  }

  external_source_setting { # list

    grammar_slot_type_setting { # list

      source { # list
        kms_key_arn    = ""     # string | required
        s3_bucket_name = ""     # string | required
        s3_object_key  = ""     # string | required

      }

    }

  }

  slot_type_values { # list

    sample_value { # list
      value = ""     # string | required

    }

    synonyms { # list
      value = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  value_selection_setting { # list
    resolution_strategy = ""     # string | required

    advanced_recognition_setting { # list
      audio_recognition_strategy = ""     # string | optional

    }

    regex_filter { # list
      pattern = ""     # string | required

    }

  }

}

