# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_vpc_connector                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_vpc_connector" "this" {

  security_groups        = []     # set(string) | required
  subnets                = []     # set(string) | required
  vpc_connector_name     = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # status                 = ""     # string | computed
  # vpc_connector_revision = 0      # number | computed

}

