# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_receipt_rule                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_receipt_rule" "this" {

  name          = ""     # string | required
  rule_set_name = ""     # string | required
  after         = ""     # string | optional
  enabled       = false  # bool | optional
  id            = ""     # string | optional+computed
  recipients    = []     # set(string) | optional
  scan_enabled  = false  # bool | optional
  tls_policy    = ""     # string | optional+computed

  # arn           = ""     # string | computed

  add_header_action { # set
    header_name  = ""     # string | required
    header_value = ""     # string | required
    position     = 0      # number | required

  }

  bounce_action { # set
    message         = ""     # string | required
    position        = 0      # number | required
    sender          = ""     # string | required
    smtp_reply_code = ""     # string | required
    status_code     = ""     # string | optional
    topic_arn       = ""     # string | optional

  }

  lambda_action { # set
    function_arn    = ""     # string | required
    position        = 0      # number | required
    invocation_type = ""     # string | optional
    topic_arn       = ""     # string | optional

  }

  s3_action { # set
    bucket_name       = ""     # string | required
    position          = 0      # number | required
    iam_role_arn      = ""     # string | optional
    kms_key_arn       = ""     # string | optional
    object_key_prefix = ""     # string | optional
    topic_arn         = ""     # string | optional

  }

  sns_action { # set
    position  = 0      # number | required
    topic_arn = ""     # string | required
    encoding  = ""     # string | optional

  }

  stop_action { # set
    position  = 0      # number | required
    scope     = ""     # string | required
    topic_arn = ""     # string | optional

  }

  workmail_action { # set
    organization_arn = ""     # string | required
    position         = 0      # number | required
    topic_arn        = ""     # string | optional

  }

}

