# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkfirewall_logging_configuration           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkfirewall_logging_configuration" "this" {

  firewall_arn = ""     # string | required
  id           = ""     # string | optional+computed

  logging_configuration { # list [1..1]

    log_destination_config { # set [1..3]
      log_destination      = {}     # map(string) | required
      log_destination_type = ""     # string | required
      log_type             = ""     # string | required

    }

  }

}

