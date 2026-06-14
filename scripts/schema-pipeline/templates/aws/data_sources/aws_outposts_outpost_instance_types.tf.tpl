# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_outposts_outpost_instance_types                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_outposts_outpost_instance_types" "this" {

  arn            = ""     # string | required
  id             = ""     # string | optional+computed

  # instance_types = []     # set(string) | computed

}

