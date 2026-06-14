# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_agent                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_agent" "this" {

  activation_key        = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  ip_address            = ""     # string | optional+computed
  name                  = ""     # string | optional
  private_link_endpoint = ""     # string | optional+computed
  security_group_arns   = []     # set(string) | optional
  subnet_arns           = []     # set(string) | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed
  vpc_endpoint_id       = ""     # string | optional

  # arn                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}

