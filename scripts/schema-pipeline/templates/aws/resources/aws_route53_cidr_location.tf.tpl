# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_cidr_location                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_cidr_location" "this" {

  cidr_blocks        = []     # set(string) | required
  cidr_collection_id = ""     # string | required
  name               = ""     # string | required

  # id                 = ""     # string | computed+DEPRECATED

}

