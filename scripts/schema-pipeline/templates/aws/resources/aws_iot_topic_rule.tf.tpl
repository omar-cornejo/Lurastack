# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_topic_rule                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_topic_rule" "this" {

  enabled     = false  # bool | required
  name        = ""     # string | required
  sql         = ""     # string | required
  sql_version = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  cloudwatch_alarm { # set
    alarm_name   = ""     # string | required
    role_arn     = ""     # string | required
    state_reason = ""     # string | required
    state_value  = ""     # string | required

  }

  cloudwatch_logs { # set
    log_group_name = ""     # string | required
    role_arn       = ""     # string | required
    batch_mode     = false  # bool | optional

  }

  cloudwatch_metric { # set
    metric_name      = ""     # string | required
    metric_namespace = ""     # string | required
    metric_unit      = ""     # string | required
    metric_value     = ""     # string | required
    role_arn         = ""     # string | required
    metric_timestamp = ""     # string | optional

  }

  dynamodb { # set
    hash_key_field  = ""     # string | required
    hash_key_value  = ""     # string | required
    role_arn        = ""     # string | required
    table_name      = ""     # string | required
    hash_key_type   = ""     # string | optional
    operation       = ""     # string | optional
    payload_field   = ""     # string | optional
    range_key_field = ""     # string | optional
    range_key_type  = ""     # string | optional
    range_key_value = ""     # string | optional

  }

  dynamodbv2 { # set
    role_arn = ""     # string | required

    put_item { # list [0..1]
      table_name = ""     # string | required

    }

  }

  elasticsearch { # set
    endpoint = ""     # string | required
    id       = ""     # string | required
    index    = ""     # string | required
    role_arn = ""     # string | required
    type     = ""     # string | required

  }

  error_action { # list [0..1]

    cloudwatch_alarm { # list [0..1]
      alarm_name   = ""     # string | required
      role_arn     = ""     # string | required
      state_reason = ""     # string | required
      state_value  = ""     # string | required

    }

    cloudwatch_logs { # list [0..1]
      log_group_name = ""     # string | required
      role_arn       = ""     # string | required
      batch_mode     = false  # bool | optional

    }

    cloudwatch_metric { # list [0..1]
      metric_name      = ""     # string | required
      metric_namespace = ""     # string | required
      metric_unit      = ""     # string | required
      metric_value     = ""     # string | required
      role_arn         = ""     # string | required
      metric_timestamp = ""     # string | optional

    }

    dynamodb { # list [0..1]
      hash_key_field  = ""     # string | required
      hash_key_value  = ""     # string | required
      role_arn        = ""     # string | required
      table_name      = ""     # string | required
      hash_key_type   = ""     # string | optional
      operation       = ""     # string | optional
      payload_field   = ""     # string | optional
      range_key_field = ""     # string | optional
      range_key_type  = ""     # string | optional
      range_key_value = ""     # string | optional

    }

    dynamodbv2 { # list [0..1]
      role_arn = ""     # string | required

      put_item { # list [0..1]
        table_name = ""     # string | required

      }

    }

    elasticsearch { # list [0..1]
      endpoint = ""     # string | required
      id       = ""     # string | required
      index    = ""     # string | required
      role_arn = ""     # string | required
      type     = ""     # string | required

    }

    firehose { # list [0..1]
      delivery_stream_name = ""     # string | required
      role_arn             = ""     # string | required
      batch_mode           = false  # bool | optional
      separator            = ""     # string | optional

    }

    http { # list [0..1]
      url              = ""     # string | required
      confirmation_url = ""     # string | optional

      http_header { # list
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

    iot_analytics { # list [0..1]
      channel_name = ""     # string | required
      role_arn     = ""     # string | required
      batch_mode   = false  # bool | optional

    }

    iot_events { # list [0..1]
      input_name = ""     # string | required
      role_arn   = ""     # string | required
      batch_mode = false  # bool | optional
      message_id = ""     # string | optional

    }

    kafka { # list [0..1]
      client_properties = {}     # map(string) | required
      destination_arn   = ""     # string | required
      topic             = ""     # string | required
      key               = ""     # string | optional
      partition         = ""     # string | optional

      header { # list
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

    kinesis { # list [0..1]
      role_arn      = ""     # string | required
      stream_name   = ""     # string | required
      partition_key = ""     # string | optional

    }

    lambda { # list [0..1]
      function_arn = ""     # string | required

    }

    republish { # list [0..1]
      role_arn = ""     # string | required
      topic    = ""     # string | required
      qos      = 0      # number | optional

    }

    s3 { # list [0..1]
      bucket_name = ""     # string | required
      key         = ""     # string | required
      role_arn    = ""     # string | required
      canned_acl  = ""     # string | optional

    }

    sns { # list [0..1]
      role_arn       = ""     # string | required
      target_arn     = ""     # string | required
      message_format = ""     # string | optional

    }

    sqs { # list [0..1]
      queue_url  = ""     # string | required
      role_arn   = ""     # string | required
      use_base64 = false  # bool | required

    }

    step_functions { # list [0..1]
      role_arn              = ""     # string | required
      state_machine_name    = ""     # string | required
      execution_name_prefix = ""     # string | optional

    }

    timestream { # list [0..1]
      database_name = ""     # string | required
      role_arn      = ""     # string | required
      table_name    = ""     # string | required

      dimension { # set [1..*]
        name  = ""     # string | required
        value = ""     # string | required

      }

      timestamp { # list [0..1]
        unit  = ""     # string | required
        value = ""     # string | required

      }

    }

  }

  firehose { # set
    delivery_stream_name = ""     # string | required
    role_arn             = ""     # string | required
    batch_mode           = false  # bool | optional
    separator            = ""     # string | optional

  }

  http { # set
    url              = ""     # string | required
    confirmation_url = ""     # string | optional

    http_header { # list
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

  iot_analytics { # set
    channel_name = ""     # string | required
    role_arn     = ""     # string | required
    batch_mode   = false  # bool | optional

  }

  iot_events { # set
    input_name = ""     # string | required
    role_arn   = ""     # string | required
    batch_mode = false  # bool | optional
    message_id = ""     # string | optional

  }

  kafka { # set
    client_properties = {}     # map(string) | required
    destination_arn   = ""     # string | required
    topic             = ""     # string | required
    key               = ""     # string | optional
    partition         = ""     # string | optional

    header { # list
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

  kinesis { # set
    role_arn      = ""     # string | required
    stream_name   = ""     # string | required
    partition_key = ""     # string | optional

  }

  lambda { # set
    function_arn = ""     # string | required

  }

  republish { # set
    role_arn = ""     # string | required
    topic    = ""     # string | required
    qos      = 0      # number | optional

  }

  s3 { # set
    bucket_name = ""     # string | required
    key         = ""     # string | required
    role_arn    = ""     # string | required
    canned_acl  = ""     # string | optional

  }

  sns { # set
    role_arn       = ""     # string | required
    target_arn     = ""     # string | required
    message_format = ""     # string | optional

  }

  sqs { # set
    queue_url  = ""     # string | required
    role_arn   = ""     # string | required
    use_base64 = false  # bool | required

  }

  step_functions { # set
    role_arn              = ""     # string | required
    state_machine_name    = ""     # string | required
    execution_name_prefix = ""     # string | optional

  }

  timestream { # set
    database_name = ""     # string | required
    role_arn      = ""     # string | required
    table_name    = ""     # string | required

    dimension { # set [1..*]
      name  = ""     # string | required
      value = ""     # string | required

    }

    timestamp { # list [0..1]
      unit  = ""     # string | required
      value = ""     # string | required

    }

  }

}

