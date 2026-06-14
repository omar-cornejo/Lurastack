# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_osis_pipeline                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_osis_pipeline" "this" {

  max_units                   = 0      # number | required
  min_units                   = 0      # number | required
  pipeline_configuration_body = ""     # string | required
  pipeline_name               = ""     # string | required
  tags                        = {}     # map(string) | optional

  # id                          = ""     # string | computed
  # ingest_endpoint_urls        = []     # set(string) | computed
  # pipeline_arn                = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed

  buffer_options { # list
    persistent_buffer_enabled = false  # bool | required

  }

  encryption_at_rest_options { # list
    kms_key_arn = ""     # string | required

  }

  log_publishing_options { # list
    is_logging_enabled = false  # bool | optional

    cloudwatch_log_destination { # list
      log_group = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  vpc_options { # list
    subnet_ids              = []     # set(string) | required
    security_group_ids      = []     # set(string) | optional
    vpc_endpoint_management = ""     # string | optional

  }

}

