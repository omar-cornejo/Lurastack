# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_notification                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_notification" "this" {

  bucket      = ""     # string | required
  eventbridge = false  # bool | optional
  id          = ""     # string | optional+computed

  lambda_function { # list
    events              = []     # set(string) | required
    filter_prefix       = ""     # string | optional
    filter_suffix       = ""     # string | optional
    id                  = ""     # string | optional+computed
    lambda_function_arn = ""     # string | optional

  }

  queue { # list
    events        = []     # set(string) | required
    queue_arn     = ""     # string | required
    filter_prefix = ""     # string | optional
    filter_suffix = ""     # string | optional
    id            = ""     # string | optional+computed

  }

  topic { # list
    events        = []     # set(string) | required
    topic_arn     = ""     # string | required
    filter_prefix = ""     # string | optional
    filter_suffix = ""     # string | optional
    id            = ""     # string | optional+computed

  }

}

