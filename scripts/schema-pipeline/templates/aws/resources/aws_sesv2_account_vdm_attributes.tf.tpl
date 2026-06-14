# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_account_vdm_attributes                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_account_vdm_attributes" "this" {

  vdm_enabled = ""     # string | required
  id          = ""     # string | optional+computed

  dashboard_attributes { # list [0..1]
    engagement_metrics = ""     # string | optional

  }

  guardian_attributes { # list [0..1]
    optimized_shared_delivery = ""     # string | optional

  }

}

