# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53recoveryreadiness_resource_set           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53recoveryreadiness_resource_set" "this" {

  resource_set_name = ""     # string | required
  resource_set_type = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

  resources { # list [1..*]
    readiness_scopes = []     # list(string) | optional
    resource_arn     = ""     # string | optional

    # component_id     = ""     # string | computed

    dns_target_resource { # list [0..1]
      domain_name     = ""     # string | required
      hosted_zone_arn = ""     # string | optional
      record_set_id   = ""     # string | optional
      record_type     = ""     # string | optional

      target_resource { # list [0..1]

        nlb_resource { # list [0..1]
          arn = ""     # string | optional

        }

        r53_resource { # list [0..1]
          domain_name   = ""     # string | optional
          record_set_id = ""     # string | optional

        }

      }

    }

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

