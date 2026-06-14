# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloud9_environment_ec2                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloud9_environment_ec2" "this" {

  image_id                    = ""     # string | required
  instance_type               = ""     # string | required
  name                        = ""     # string | required
  automatic_stop_time_minutes = 0      # number | optional
  connection_type             = ""     # string | optional
  description                 = ""     # string | optional
  id                          = ""     # string | optional+computed
  owner_arn                   = ""     # string | optional+computed
  subnet_id                   = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # type                        = ""     # string | computed

}

