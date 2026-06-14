# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_tag                                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_tag" "this" {

  key         = ""     # string | required
  resource_id = ""     # string | required
  value       = ""     # string | required
  id          = ""     # string | optional+computed

}

