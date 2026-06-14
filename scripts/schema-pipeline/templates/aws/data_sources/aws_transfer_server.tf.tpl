# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_transfer_server                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_transfer_server" "this" {

  server_id                   = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # certificate                 = ""     # string | computed
  # domain                      = ""     # string | computed
  # endpoint                    = ""     # string | computed
  # endpoint_type               = ""     # string | computed
  # identity_provider_type      = ""     # string | computed
  # invocation_role             = ""     # string | computed
  # logging_role                = ""     # string | computed
  # protocols                   = []     # list(string) | computed
  # security_policy_name        = ""     # string | computed
  # structured_log_destinations = []     # list(string) | computed
  # url                         = ""     # string | computed

}

