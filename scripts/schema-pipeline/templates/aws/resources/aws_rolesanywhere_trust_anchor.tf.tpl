# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rolesanywhere_trust_anchor                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rolesanywhere_trust_anchor" "this" {

  name     = ""     # string | required
  enabled  = false  # bool | optional+computed
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  notification_settings { # set [0..50]
    channel       = ""     # string | optional+computed
    enabled       = false  # bool | optional+computed
    event         = ""     # string | optional+computed
    threshold     = 0      # number | optional+computed

    # configured_by = ""     # string | computed

  }

  source { # list [1..1]
    source_type = ""     # string | required

    source_data { # list [1..1]
      acm_pca_arn           = ""     # string | optional
      x509_certificate_data = ""     # string | optional

    }

  }

}

