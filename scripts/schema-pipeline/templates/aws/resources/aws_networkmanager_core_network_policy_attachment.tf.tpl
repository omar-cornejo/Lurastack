# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_core_network_policy_attachment   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_core_network_policy_attachment" "this" {

  core_network_id = ""     # string | required
  policy_document = ""     # string | required
  id              = ""     # string | optional+computed

  # state           = ""     # string | computed

  timeouts { # single
    update = ""     # string | optional

  }

}

