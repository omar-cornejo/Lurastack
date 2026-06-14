# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chimesdkmediapipelines_media_insights_pipeline_configuration  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chimesdkmediapipelines_media_insights_pipeline_configuration" "this" {

  name                     = ""     # string | required
  resource_access_role_arn = ""     # string | required
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # id                       = ""     # string | computed

  elements { # list [1..*]
    type = ""     # string | required

    amazon_transcribe_call_analytics_processor_configuration { # list [0..1]
      language_code                        = ""     # string | required
      call_analytics_stream_categories     = []     # list(string) | optional
      content_identification_type          = ""     # string | optional
      content_redaction_type               = ""     # string | optional
      enable_partial_results_stabilization = false  # bool | optional
      filter_partial_results               = false  # bool | optional
      language_model_name                  = ""     # string | optional
      partial_results_stability            = ""     # string | optional
      pii_entity_types                     = ""     # string | optional
      vocabulary_filter_method             = ""     # string | optional
      vocabulary_filter_name               = ""     # string | optional
      vocabulary_name                      = ""     # string | optional

      post_call_analytics_settings { # list [0..1]
        data_access_role_arn         = ""     # string | required
        output_location              = ""     # string | required
        content_redaction_output     = ""     # string | optional
        output_encryption_kms_key_id = ""     # string | optional

      }

    }

    amazon_transcribe_processor_configuration { # list [0..1]
      language_code                        = ""     # string | required
      content_identification_type          = ""     # string | optional
      content_redaction_type               = ""     # string | optional
      enable_partial_results_stabilization = false  # bool | optional
      filter_partial_results               = false  # bool | optional
      language_model_name                  = ""     # string | optional
      partial_results_stability            = ""     # string | optional
      pii_entity_types                     = ""     # string | optional
      show_speaker_label                   = false  # bool | optional
      vocabulary_filter_method             = ""     # string | optional
      vocabulary_filter_name               = ""     # string | optional
      vocabulary_name                      = ""     # string | optional

    }

    kinesis_data_stream_sink_configuration { # list [0..1]
      insights_target = ""     # string | required

    }

    lambda_function_sink_configuration { # list [0..1]
      insights_target = ""     # string | required

    }

    s3_recording_sink_configuration { # list [0..1]
      destination = ""     # string | optional

    }

    sns_topic_sink_configuration { # list [0..1]
      insights_target = ""     # string | required

    }

    sqs_queue_sink_configuration { # list [0..1]
      insights_target = ""     # string | required

    }

    voice_analytics_processor_configuration { # list [0..1]
      speaker_search_status      = ""     # string | required
      voice_tone_analysis_status = ""     # string | required

    }

  }

  real_time_alert_configuration { # list [0..1]
    disabled = false  # bool | optional+computed

    rules { # list [1..3]
      type = ""     # string | required

      issue_detection_configuration { # list [0..1]
        rule_name = ""     # string | required

      }

      keyword_match_configuration { # list [0..1]
        keywords  = []     # list(string) | required
        rule_name = ""     # string | required
        negate    = false  # bool | optional+computed

      }

      sentiment_configuration { # list [0..1]
        rule_name      = ""     # string | required
        sentiment_type = ""     # string | required
        time_period    = 0      # number | required

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

