# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_instance_metadata_defaults                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_instance_metadata_defaults" "this" {

  http_endpoint               = ""     # string | optional+computed
  http_put_response_hop_limit = 0      # number | optional+computed
  http_tokens                 = ""     # string | optional+computed
  instance_metadata_tags      = ""     # string | optional+computed

  # id                          = ""     # string | computed

}

