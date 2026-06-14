# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_inference_profile                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_inference_profile" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # created_at  = ""     # string | computed
  # id          = ""     # string | computed
  # models = [  # list(object)
  #   {
  #     model_arn = ""
  #   }
  # ]
  # status      = ""     # string | computed
  # tags_all    = {}     # map(string) | computed
  # type        = ""     # string | computed
  # updated_at  = ""     # string | computed

  model_source { # list
    copy_from = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

