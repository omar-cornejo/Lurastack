# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_contact_flow_module                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_contact_flow_module" "this" {

  instance_id            = ""     # string | required
  contact_flow_module_id = ""     # string | optional+computed
  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # content                = ""     # string | computed
  # description            = ""     # string | computed
  # state                  = ""     # string | computed
  # status                 = ""     # string | computed

}

