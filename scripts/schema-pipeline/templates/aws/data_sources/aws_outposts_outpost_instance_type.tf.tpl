# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_outpost_instance_type                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_outpost_instance_type" "this" {

  arn                      = ""     # string | required
  id                       = ""     # string | optional+computed
  instance_type            = ""     # string | optional+computed
  preferred_instance_types = []     # list(string) | optional

}

