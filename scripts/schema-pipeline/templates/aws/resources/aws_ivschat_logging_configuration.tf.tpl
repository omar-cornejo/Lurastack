# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ivschat_logging_configuration                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ivschat_logging_configuration" "this" {

  id       = ""     # string | optional+computed
  name     = ""     # string | optional
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # state    = ""     # string | computed

  destination_configuration { # list [0..1]

    cloudwatch_logs { # list [0..1]
      log_group_name = ""     # string | required

    }

    firehose { # list [0..1]
      delivery_stream_name = ""     # string | required

    }

    s3 { # list [0..1]
      bucket_name = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

