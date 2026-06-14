# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_object_lambda_access_point            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_object_lambda_access_point" "this" {

  name       = ""     # string | required
  account_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed

  # alias      = ""     # string | computed
  # arn        = ""     # string | computed

  configuration { # list [1..1]
    supporting_access_point     = ""     # string | required
    allowed_features            = []     # set(string) | optional
    cloud_watch_metrics_enabled = false  # bool | optional

    transformation_configuration { # set [1..*]
      actions = []     # set(string) | required

      content_transformation { # list [1..1]

        aws_lambda { # list [1..1]
          function_arn     = ""     # string | required
          function_payload = ""     # string | optional

        }

      }

    }

  }

}

