# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_globalaccelerator_cross_account_attachment      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_globalaccelerator_cross_account_attachment" "this" {

  name               = ""     # string | required
  principals         = []     # set(string) | optional
  tags               = {}     # map(string) | optional

  # arn                = ""     # string | computed
  # created_time       = ""     # string | computed
  # id                 = ""     # string | computed
  # last_modified_time = ""     # string | computed
  # tags_all           = {}     # map(string) | computed

  resource { # set
    cidr_block  = ""     # string | optional
    endpoint_id = ""     # string | optional
    region      = ""     # string | optional

  }

}

