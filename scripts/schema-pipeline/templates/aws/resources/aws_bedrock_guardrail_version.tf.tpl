# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_guardrail_version                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_guardrail_version" "this" {

  guardrail_arn = ""     # string | required
  description   = ""     # string | optional
  skip_destroy  = false  # bool | optional

  # version       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

