# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_function                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_function" "this" {

  api_id                    = ""     # string | required
  data_source               = ""     # string | required
  name                      = ""     # string | required
  code                      = ""     # string | optional
  description               = ""     # string | optional
  function_version          = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  max_batch_size            = 0      # number | optional
  request_mapping_template  = ""     # string | optional
  response_mapping_template = ""     # string | optional

  # arn                       = ""     # string | computed
  # function_id               = ""     # string | computed

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

