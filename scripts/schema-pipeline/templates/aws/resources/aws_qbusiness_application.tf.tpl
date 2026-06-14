# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_qbusiness_application                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_qbusiness_application" "this" {

  display_name                    = ""     # string | required | The display name of the Amazon Q application.
  iam_service_role_arn            = ""     # string | required | The Amazon Resource Name (ARN) of the IAM service role that …
  identity_center_instance_arn    = ""     # string | required | ARN of the IAM Identity Center instance you are either creat…
  description                     = ""     # string | optional | A description of the Amazon Q application.
  tags                            = {}     # map(string) | optional

  # arn                             = ""     # string | computed
  # id                              = ""     # string | computed
  # identity_center_application_arn = ""     # string | computed
  # tags_all                        = {}     # map(string) | computed

  attachments_configuration { # list
    attachments_control_mode = ""     # string | required | Status information about whether file upload functionality i…

  }

  encryption_configuration { # list
    kms_key_id = ""     # string | required | The identifier of the AWS KMS key that is used to encrypt yo…

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

