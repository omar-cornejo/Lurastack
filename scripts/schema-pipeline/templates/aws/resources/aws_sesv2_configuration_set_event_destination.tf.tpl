# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_configuration_set_event_destination       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_configuration_set_event_destination" "this" {

  configuration_set_name = ""     # string | required
  event_destination_name = ""     # string | required
  id                     = ""     # string | optional+computed

  event_destination { # list [1..1]
    matching_event_types = []     # set(string) | required
    enabled              = false  # bool | optional

    cloud_watch_destination { # list [0..1]

      dimension_configuration { # list [1..*]
        default_dimension_value = ""     # string | required
        dimension_name          = ""     # string | required
        dimension_value_source  = ""     # string | required

      }

    }

    event_bridge_destination { # list [0..1]
      event_bus_arn = ""     # string | required

    }

    kinesis_firehose_destination { # list [0..1]
      delivery_stream_arn = ""     # string | required
      iam_role_arn        = ""     # string | required

    }

    pinpoint_destination { # list [0..1]
      application_arn = ""     # string | required

    }

    sns_destination { # list [0..1]
      topic_arn = ""     # string | required

    }

  }

}

