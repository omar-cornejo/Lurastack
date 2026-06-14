# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_wafv2_web_acl_logging_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_wafv2_web_acl_logging_configuration" "this" {

  log_destination_configs = []     # set(string) | required | AWS Kinesis Firehose Delivery Stream ARNs
  resource_arn            = ""     # string | required | AWS WebACL ARN
  id                      = ""     # string | optional+computed

  logging_filter { # list [0..1]
    default_behavior = ""     # string | required

    filter { # set [1..*]
      behavior    = ""     # string | required
      requirement = ""     # string | required

      condition { # set [1..*]

        action_condition { # list [0..1]
          action = ""     # string | required

        }

        label_name_condition { # list [0..1]
          label_name = ""     # string | required

        }

      }

    }

  }

  redacted_fields { # list [0..100]

    method {} # list [0..1]

    query_string {} # list [0..1]

    single_header { # list [0..1]
      name = ""     # string | required

    }

    uri_path {} # list [0..1]

  }

}

