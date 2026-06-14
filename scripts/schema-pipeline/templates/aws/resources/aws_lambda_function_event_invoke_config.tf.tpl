# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_function_event_invoke_config             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_function_event_invoke_config" "this" {

  function_name                = ""     # string | required
  id                           = ""     # string | optional+computed
  maximum_event_age_in_seconds = 0      # number | optional
  maximum_retry_attempts       = 0      # number | optional
  qualifier                    = ""     # string | optional

  destination_config { # list [0..1]

    on_failure { # list [0..1]
      destination = ""     # string | required

    }

    on_success { # list [0..1]
      destination = ""     # string | required

    }

  }

}

