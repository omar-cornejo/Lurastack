# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_realtime_log_config                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_realtime_log_config" "this" {

  fields        = []     # set(string) | required
  name          = ""     # string | required
  sampling_rate = 0      # number | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed

  endpoint { # list [1..1]
    stream_type = ""     # string | required

    kinesis_stream_config { # list [1..1]
      role_arn   = ""     # string | required
      stream_arn = ""     # string | required

    }

  }

}

