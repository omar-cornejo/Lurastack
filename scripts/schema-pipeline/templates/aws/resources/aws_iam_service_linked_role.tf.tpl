# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_service_linked_role                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_service_linked_role" "this" {

  aws_service_name = ""     # string | required
  custom_suffix    = ""     # string | optional
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # create_date      = ""     # string | computed
  # name             = ""     # string | computed
  # path             = ""     # string | computed
  # unique_id        = ""     # string | computed

}

