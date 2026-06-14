# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_log_data_protection_policy_document      │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_log_data_protection_policy_document" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  version     = ""     # string | optional

  # json        = ""     # string | computed

  configuration { # list [0..1]

    custom_data_identifier { # list [0..10]
      name  = ""     # string | required
      regex = ""     # string | required

    }

  }

  statement { # list [2..2]
    data_identifiers = []     # set(string) | required
    sid              = ""     # string | optional

    operation { # list [1..1]

      audit { # list [0..1]

        findings_destination { # list [1..1]

          cloudwatch_logs { # list [0..1]
            log_group = ""     # string | required

          }

          firehose { # list [0..1]
            delivery_stream = ""     # string | required

          }

          s3 { # list [0..1]
            bucket = ""     # string | required

          }

        }

      }

      deidentify { # list [0..1]

        mask_config {} # list [1..1]

      }

    }

  }

}

