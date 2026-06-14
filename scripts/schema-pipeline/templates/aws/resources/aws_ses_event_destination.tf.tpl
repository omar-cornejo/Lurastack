# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_event_destination                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_event_destination" "this" {

  configuration_set_name = ""     # string | required
  matching_types         = []     # set(string) | required
  name                   = ""     # string | required
  enabled                = false  # bool | optional
  id                     = ""     # string | optional+computed

  # arn                    = ""     # string | computed

  cloudwatch_destination { # set
    default_value  = ""     # string | required
    dimension_name = ""     # string | required
    value_source   = ""     # string | required

  }

  kinesis_destination { # list [0..1]
    role_arn   = ""     # string | required
    stream_arn = ""     # string | required

  }

  sns_destination { # list [0..1]
    topic_arn = ""     # string | required

  }

}

