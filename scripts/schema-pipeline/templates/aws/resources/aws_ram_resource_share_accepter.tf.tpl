# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ram_resource_share_accepter                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ram_resource_share_accepter" "this" {

  share_arn           = ""     # string | required
  id                  = ""     # string | optional+computed

  # invitation_arn      = ""     # string | computed
  # receiver_account_id = ""     # string | computed
  # resources           = []     # list(string) | computed
  # sender_account_id   = ""     # string | computed
  # share_id            = ""     # string | computed
  # share_name          = ""     # string | computed
  # status              = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

