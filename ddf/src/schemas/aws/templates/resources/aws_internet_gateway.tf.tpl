# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_internet_gateway                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_internet_gateway" "this" {

  id       = ""     # string | optional+computed
  tags     = {}     # map of string | optional
  tags_all = {}     # map of string | optional+computed
  vpc_id   = ""     # string | optional+computed
  # arn      = ... # string | computed
  # owner_id = ... # string | computed

  timeouts {
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

