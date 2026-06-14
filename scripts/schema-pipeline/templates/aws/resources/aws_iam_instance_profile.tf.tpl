# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_instance_profile                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_instance_profile" "this" {

  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed
  path        = ""     # string | optional
  role        = ""     # string | optional
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # create_date = ""     # string | computed
  # unique_id   = ""     # string | computed

}

