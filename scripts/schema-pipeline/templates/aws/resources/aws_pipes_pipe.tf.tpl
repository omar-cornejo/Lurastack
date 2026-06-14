# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pipes_pipe                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pipes_pipe" "this" {

  role_arn           = ""     # string | required
  source             = ""     # string | required
  target             = ""     # string | required
  description        = ""     # string | optional
  desired_state      = ""     # string | optional
  enrichment         = ""     # string | optional
  id                 = ""     # string | optional+computed
  kms_key_identifier = ""     # string | optional
  name               = ""     # string | optional+computed
  name_prefix        = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  enrichment_parameters { # list [0..1]
    input_template = ""     # string | optional

    http_parameters { # list [0..1]
      header_parameters       = {}     # map(string) | optional
      path_parameter_values   = []     # list(string) | optional
      query_string_parameters = {}     # map(string) | optional

    }

  }

  log_configuration { # list [0..1]
    level                  = ""     # string | required
    include_execution_data = []     # set(string) | optional

    cloudwatch_logs_log_destination { # list [0..1]
      log_group_arn = ""     # string | required

    }

    firehose_log_destination { # list [0..1]
      delivery_stream_arn = ""     # string | required

    }

    s3_log_destination { # list [0..1]
      bucket_name   = ""     # string | required
      bucket_owner  = ""     # string | required
      output_format = ""     # string | optional
      prefix        = ""     # string | optional

    }

  }

  source_parameters { # list [0..1]

    activemq_broker_parameters { # list [0..1]
      queue_name                         = ""     # string | required
      batch_size                         = 0      # number | optional+computed
      maximum_batching_window_in_seconds = 0      # number | optional+computed

      credentials { # list [1..1]
        basic_auth = ""     # string | required

      }

    }

    dynamodb_stream_parameters { # list [0..1]
      starting_position                  = ""     # string | required
      batch_size                         = 0      # number | optional+computed
      maximum_batching_window_in_seconds = 0      # number | optional+computed
      maximum_record_age_in_seconds      = 0      # number | optional+computed
      maximum_retry_attempts             = 0      # number | optional
      on_partial_batch_item_failure      = ""     # string | optional
      parallelization_factor             = 0      # number | optional+computed

      dead_letter_config { # list [0..1]
        arn = ""     # string | optional

      }

    }

    filter_criteria { # list [0..1]

      filter { # list [0..5]
        pattern = ""     # string | required

      }

    }

    kinesis_stream_parameters { # list [0..1]
      starting_position                  = ""     # string | required
      batch_size                         = 0      # number | optional+computed
      maximum_batching_window_in_seconds = 0      # number | optional+computed
      maximum_record_age_in_seconds      = 0      # number | optional+computed
      maximum_retry_attempts             = 0      # number | optional
      on_partial_batch_item_failure      = ""     # string | optional
      parallelization_factor             = 0      # number | optional+computed
      starting_position_timestamp        = ""     # string | optional

      dead_letter_config { # list [0..1]
        arn = ""     # string | optional

      }

    }

    managed_streaming_kafka_parameters { # list [0..1]
      topic_name                         = ""     # string | required
      batch_size                         = 0      # number | optional+computed
      consumer_group_id                  = ""     # string | optional
      maximum_batching_window_in_seconds = 0      # number | optional+computed
      starting_position                  = ""     # string | optional

      credentials { # list [0..1]
        client_certificate_tls_auth = ""     # string | optional
        sasl_scram_512_auth         = ""     # string | optional

      }

    }

    rabbitmq_broker_parameters { # list [0..1]
      queue_name                         = ""     # string | required
      batch_size                         = 0      # number | optional+computed
      maximum_batching_window_in_seconds = 0      # number | optional+computed
      virtual_host                       = ""     # string | optional

      credentials { # list [1..1]
        basic_auth = ""     # string | required

      }

    }

    self_managed_kafka_parameters { # list [0..1]
      topic_name                         = ""     # string | required
      additional_bootstrap_servers       = []     # set(string) | optional
      batch_size                         = 0      # number | optional+computed
      consumer_group_id                  = ""     # string | optional
      maximum_batching_window_in_seconds = 0      # number | optional+computed
      server_root_ca_certificate         = ""     # string | optional
      starting_position                  = ""     # string | optional

      credentials { # list [0..1]
        basic_auth                  = ""     # string | optional
        client_certificate_tls_auth = ""     # string | optional
        sasl_scram_256_auth         = ""     # string | optional
        sasl_scram_512_auth         = ""     # string | optional

      }

      vpc { # list [0..1]
        security_groups = []     # set(string) | optional
        subnets         = []     # set(string) | optional

      }

    }

    sqs_queue_parameters { # list [0..1]
      batch_size                         = 0      # number | optional+computed
      maximum_batching_window_in_seconds = 0      # number | optional+computed

    }

  }

  target_parameters { # list [0..1]
    input_template = ""     # string | optional

    batch_job_parameters { # list [0..1]
      job_definition = ""     # string | required
      job_name       = ""     # string | required
      parameters     = {}     # map(string) | optional

      array_properties { # list [0..1]
        size = 0      # number | optional

      }

      container_overrides { # list [0..1]
        command       = []     # list(string) | optional
        instance_type = ""     # string | optional

        environment { # list
          name  = ""     # string | optional
          value = ""     # string | optional

        }

        resource_requirement { # list
          type  = ""     # string | required
          value = ""     # string | required

        }

      }

      depends_on { # list [0..20]
        job_id = ""     # string | optional
        type   = ""     # string | optional

      }

      retry_strategy { # list [0..1]
        attempts = 0      # number | optional

      }

    }

    cloudwatch_logs_parameters { # list [0..1]
      log_stream_name = ""     # string | optional
      timestamp       = ""     # string | optional

    }

    ecs_task_parameters { # list [0..1]
      task_definition_arn     = ""     # string | required
      enable_ecs_managed_tags = false  # bool | optional
      enable_execute_command  = false  # bool | optional
      group                   = ""     # string | optional
      launch_type             = ""     # string | optional
      platform_version        = ""     # string | optional
      propagate_tags          = ""     # string | optional
      reference_id            = ""     # string | optional
      tags                    = {}     # map(string) | optional
      task_count              = 0      # number | optional

      capacity_provider_strategy { # list [0..6]
        capacity_provider = ""     # string | required
        base              = 0      # number | optional
        weight            = 0      # number | optional

      }

      network_configuration { # list [0..1]

        aws_vpc_configuration { # list [0..1]
          assign_public_ip = ""     # string | optional
          security_groups  = []     # set(string) | optional
          subnets          = []     # set(string) | optional

        }

      }

      overrides { # list [0..1]
        cpu                = ""     # string | optional
        execution_role_arn = ""     # string | optional
        memory             = ""     # string | optional
        task_role_arn      = ""     # string | optional

        container_override { # list
          command            = []     # list(string) | optional
          cpu                = 0      # number | optional
          memory             = 0      # number | optional
          memory_reservation = 0      # number | optional
          name               = ""     # string | optional

          environment { # list
            name  = ""     # string | optional
            value = ""     # string | optional

          }

          environment_file { # list
            type  = ""     # string | required
            value = ""     # string | required

          }

          resource_requirement { # list
            type  = ""     # string | required
            value = ""     # string | required

          }

        }

        ephemeral_storage { # list [0..1]
          size_in_gib = 0      # number | required

        }

        inference_accelerator_override { # list
          device_name = ""     # string | optional
          device_type = ""     # string | optional

        }

      }

      placement_constraint { # list [0..10]
        expression = ""     # string | optional
        type       = ""     # string | optional

      }

      placement_strategy { # list [0..5]
        field = ""     # string | optional
        type  = ""     # string | optional

      }

    }

    eventbridge_event_bus_parameters { # list [0..1]
      detail_type = ""     # string | optional
      endpoint_id = ""     # string | optional
      resources   = []     # set(string) | optional
      source      = ""     # string | optional
      time        = ""     # string | optional

    }

    http_parameters { # list [0..1]
      header_parameters       = {}     # map(string) | optional
      path_parameter_values   = []     # list(string) | optional
      query_string_parameters = {}     # map(string) | optional

    }

    kinesis_stream_parameters { # list [0..1]
      partition_key = ""     # string | required

    }

    lambda_function_parameters { # list [0..1]
      invocation_type = ""     # string | required

    }

    redshift_data_parameters { # list [0..1]
      database           = ""     # string | required
      sqls               = []     # set(string) | required
      db_user            = ""     # string | optional
      secret_manager_arn = ""     # string | optional
      statement_name     = ""     # string | optional
      with_event         = false  # bool | optional

    }

    sagemaker_pipeline_parameters { # list [0..1]

      pipeline_parameter { # list [0..200]
        name  = ""     # string | required
        value = ""     # string | required

      }

    }

    sqs_queue_parameters { # list [0..1]
      message_deduplication_id = ""     # string | optional
      message_group_id         = ""     # string | optional

    }

    step_function_state_machine_parameters { # list [0..1]
      invocation_type = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

