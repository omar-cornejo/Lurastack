# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rekognition_collection                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rekognition_collection" "this" {

  collection_id      = ""     # string | required | The name of the Rekognition collection
  tags               = {}     # map(string) | optional

  # arn                = ""     # string | computed
  # face_model_version = ""     # string | computed
  # id                 = ""     # string | computed
  # tags_all           = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

