# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rekognition_project                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rekognition_project" "this" {

  name        = ""     # string | required
  auto_update = ""     # string | optional+computed
  feature     = ""     # string | optional
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # id          = ""     # string | computed
  # tags_all    = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

