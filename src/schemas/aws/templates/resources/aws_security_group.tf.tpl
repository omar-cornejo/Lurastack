# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_security_group                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_security_group" "this" {

  description            = ""     # string | optional
  egress                 = []     # set(object({ cidr_blocks: list(string), description: string, from_port: number, ipv6_cidr_blocks: list(string), prefix_list_ids: list(string), protocol: string, security_groups: set(string), self: bool, to_port: number })) | optional+computed
  id                     = ""     # string | optional+computed
  ingress                = []     # set(object({ cidr_blocks: list(string), description: string, from_port: number, ipv6_cidr_blocks: list(string), prefix_list_ids: list(string), protocol: string, security_groups: set(string), self: bool, to_port: number })) | optional+computed
  name                   = ""     # string | optional+computed
  name_prefix            = ""     # string | optional+computed
  revoke_rules_on_delete = false  # bool | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  vpc_id                 = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # owner_id               = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

