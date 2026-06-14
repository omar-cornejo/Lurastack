# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53domains_delegation_signer_record         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53domains_delegation_signer_record" "this" {

  domain_name   = ""     # string | required

  # dnssec_key_id = ""     # string | computed
  # id            = ""     # string | computed

  signing_attributes { # list
    algorithm  = 0      # number | required
    flags      = 0      # number | required
    public_key = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

