# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_event_source_mapping                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_event_source_mapping" "this" {

  function_name                      = ""     # string | required
  batch_size                         = 0      # number | optional
  bisect_batch_on_function_error     = false  # bool | optional
  enabled                            = false  # bool | optional
  event_source_arn                   = ""     # string | optional
  function_response_types            = []     # set(string) | optional
  id                                 = ""     # string | optional+computed
  kms_key_arn                        = ""     # string | optional
  maximum_batching_window_in_seconds = 0      # number | optional
  maximum_record_age_in_seconds      = 0      # number | optional+computed
  maximum_retry_attempts             = 0      # number | optional+computed
  parallelization_factor             = 0      # number | optional+computed
  queues                             = []     # list(string) | optional
  starting_position                  = ""     # string | optional
  starting_position_timestamp        = ""     # string | optional
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  topics                             = []     # set(string) | optional
  tumbling_window_in_seconds         = 0      # number | optional

  # arn                                = ""     # string | computed
  # function_arn                       = ""     # string | computed
  # last_modified                      = ""     # string | computed
  # last_processing_result             = ""     # string | computed
  # state                              = ""     # string | computed
  # state_transition_reason            = ""     # string | computed
  # uuid                               = ""     # string | computed

  amazon_managed_kafka_event_source_config { # list [0..1]
    consumer_group_id = ""     # string | optional+computed

  }

  destination_config { # list [0..1]

    on_failure { # list [0..1]
      destination_arn = ""     # string | required

    }

  }

  document_db_event_source_config { # list [0..1]
    database_name   = ""     # string | required
    collection_name = ""     # string | optional
    full_document   = ""     # string | optional

  }

  filter_criteria { # list [0..1]

    filter { # set [0..10]
      pattern = ""     # string | optional

    }

  }

  metrics_config { # list [0..1]
    metrics = []     # set(string) | required

  }

  provisioned_poller_config { # list [0..1]
    maximum_pollers = 0      # number | optional+computed
    minimum_pollers = 0      # number | optional+computed

  }

  scaling_config { # list [0..1]
    maximum_concurrency = 0      # number | optional

  }

  self_managed_event_source { # list [0..1]
    endpoints = {}     # map(string) | required

  }

  self_managed_kafka_event_source_config { # list [0..1]
    consumer_group_id = ""     # string | optional+computed

  }

  source_access_configuration { # set [0..22]
    type = ""     # string | required
    uri  = ""     # string | required

  }

}

