# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_managed_prefix_list_entry                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_managed_prefix_list_entry" "this" {

  cidr           = ""     # string | required
  prefix_list_id = ""     # string | required
  description    = ""     # string | optional
  id             = ""     # string | optional+computed

}

