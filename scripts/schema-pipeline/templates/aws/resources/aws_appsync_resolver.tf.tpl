# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_resolver                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_resolver" "this" {

  api_id            = ""     # string | required
  field             = ""     # string | required
  type              = ""     # string | required
  code              = ""     # string | optional
  data_source       = ""     # string | optional
  id                = ""     # string | optional+computed
  kind              = ""     # string | optional
  max_batch_size    = 0      # number | optional
  request_template  = ""     # string | optional
  response_template = ""     # string | optional

  # arn               = ""     # string | computed

  caching_config { # list [0..1]
    caching_keys = []     # set(string) | optional
    ttl          = 0      # number | optional

  }

  pipeline_config { # list [0..1]
    functions = []     # list(string) | optional

  }

  runtime { # list [0..1]
    name            = ""     # string | required
    runtime_version = ""     # string | required

  }

  sync_config { # list [0..1]
    conflict_detection = ""     # string | optional
    conflict_handler   = ""     # string | optional

    lambda_conflict_handler_config { # list [0..1]
      lambda_conflict_handler_arn = ""     # string | optional

    }

  }

}

