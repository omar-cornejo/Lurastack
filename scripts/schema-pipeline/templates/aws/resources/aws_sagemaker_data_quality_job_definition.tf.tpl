# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_data_quality_job_definition           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_data_quality_job_definition" "this" {

  role_arn = ""     # string | required
  id       = ""     # string | optional+computed
  name     = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  data_quality_app_specification { # list [1..1]
    image_uri                           = ""     # string | required
    environment                         = {}     # map(string) | optional
    post_analytics_processor_source_uri = ""     # string | optional
    record_preprocessor_source_uri      = ""     # string | optional

  }

  data_quality_baseline_config { # list [0..1]

    constraints_resource { # list [0..1]
      s3_uri = ""     # string | optional

    }

    statistics_resource { # list [0..1]
      s3_uri = ""     # string | optional

    }

  }

  data_quality_job_input { # list [1..1]

    batch_transform_input { # list [0..1]
      data_captured_destination_s3_uri = ""     # string | required
      local_path                       = ""     # string | optional
      s3_data_distribution_type        = ""     # string | optional+computed
      s3_input_mode                    = ""     # string | optional+computed

      dataset_format { # list [1..1]

        csv { # list [0..1]
          header = false  # bool | optional

        }

        json { # list [0..1]
          line = false  # bool | optional

        }

      }

    }

    endpoint_input { # list [0..1]
      endpoint_name             = ""     # string | required
      local_path                = ""     # string | optional
      s3_data_distribution_type = ""     # string | optional+computed
      s3_input_mode             = ""     # string | optional+computed

    }

  }

  data_quality_job_output_config { # list [1..1]
    kms_key_id = ""     # string | optional

    monitoring_outputs { # list [1..1]

      s3_output { # list [1..1]
        s3_uri         = ""     # string | required
        local_path     = ""     # string | optional
        s3_upload_mode = ""     # string | optional+computed

      }

    }

  }

  job_resources { # list [1..1]

    cluster_config { # list [1..1]
      instance_count    = 0      # number | required
      instance_type     = ""     # string | required
      volume_size_in_gb = 0      # number | required
      volume_kms_key_id = ""     # string | optional

    }

  }

  network_config { # list [0..1]
    enable_inter_container_traffic_encryption = false  # bool | optional
    enable_network_isolation                  = false  # bool | optional

    vpc_config { # list [0..1]
      security_group_ids = []     # set(string) | required
      subnets            = []     # set(string) | required

    }

  }

  stopping_condition { # list [0..1]
    max_runtime_in_seconds = 0      # number | optional+computed

  }

}

