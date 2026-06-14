# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_endpoint_configuration                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_endpoint_configuration" "this" {

  id          = ""     # string | optional+computed
  kms_key_arn = ""     # string | optional
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  async_inference_config { # list [0..1]

    client_config { # list [0..1]
      max_concurrent_invocations_per_instance = 0      # number | optional

    }

    output_config { # list [1..1]
      s3_output_path  = ""     # string | required
      kms_key_id      = ""     # string | optional
      s3_failure_path = ""     # string | optional

      notification_config { # list [0..1]
        error_topic                   = ""     # string | optional
        include_inference_response_in = []     # set(string) | optional
        success_topic                 = ""     # string | optional

      }

    }

  }

  data_capture_config { # list [0..1]
    destination_s3_uri          = ""     # string | required
    initial_sampling_percentage = 0      # number | required
    enable_capture              = false  # bool | optional
    kms_key_id                  = ""     # string | optional

    capture_content_type_header { # list [0..1]
      csv_content_types  = []     # set(string) | optional
      json_content_types = []     # set(string) | optional

    }

    capture_options { # list [1..2]
      capture_mode = ""     # string | required

    }

  }

  production_variants { # list [1..10]
    model_name                                        = ""     # string | required
    accelerator_type                                  = ""     # string | optional
    container_startup_health_check_timeout_in_seconds = 0      # number | optional
    enable_ssm_access                                 = false  # bool | optional
    inference_ami_version                             = ""     # string | optional
    initial_instance_count                            = 0      # number | optional
    initial_variant_weight                            = 0      # number | optional
    instance_type                                     = ""     # string | optional
    model_data_download_timeout_in_seconds            = 0      # number | optional
    variant_name                                      = ""     # string | optional+computed
    volume_size_in_gb                                 = 0      # number | optional+computed

    core_dump_config { # list [0..1]
      destination_s3_uri = ""     # string | required
      kms_key_id         = ""     # string | optional

    }

    managed_instance_scaling { # list [0..1]
      max_instance_count = 0      # number | optional
      min_instance_count = 0      # number | optional
      status             = ""     # string | optional

    }

    routing_config { # list
      routing_strategy = ""     # string | required

    }

    serverless_config { # list [0..1]
      max_concurrency         = 0      # number | required
      memory_size_in_mb       = 0      # number | required
      provisioned_concurrency = 0      # number | optional

    }

  }

  shadow_production_variants { # list [0..10]
    model_name                                        = ""     # string | required
    accelerator_type                                  = ""     # string | optional
    container_startup_health_check_timeout_in_seconds = 0      # number | optional
    enable_ssm_access                                 = false  # bool | optional
    inference_ami_version                             = ""     # string | optional
    initial_instance_count                            = 0      # number | optional
    initial_variant_weight                            = 0      # number | optional
    instance_type                                     = ""     # string | optional
    model_data_download_timeout_in_seconds            = 0      # number | optional
    variant_name                                      = ""     # string | optional+computed
    volume_size_in_gb                                 = 0      # number | optional

    core_dump_config { # list [0..1]
      destination_s3_uri = ""     # string | required
      kms_key_id         = ""     # string | required

    }

    managed_instance_scaling { # list [0..1]
      max_instance_count = 0      # number | optional
      min_instance_count = 0      # number | optional
      status             = ""     # string | optional

    }

    routing_config { # list
      routing_strategy = ""     # string | required

    }

    serverless_config { # list [0..1]
      max_concurrency         = 0      # number | required
      memory_size_in_mb       = 0      # number | required
      provisioned_concurrency = 0      # number | optional

    }

  }

}

