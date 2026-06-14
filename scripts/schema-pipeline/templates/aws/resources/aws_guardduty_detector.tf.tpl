# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_detector                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_detector" "this" {

  enable                       = false  # bool | optional
  finding_publishing_frequency = ""     # string | optional+computed
  id                           = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # account_id                   = ""     # string | computed
  # arn                          = ""     # string | computed

  datasources { # list [0..1]

    kubernetes { # list [0..1]

      audit_logs { # list [1..1]
        enable = false  # bool | required

      }

    }

    malware_protection { # list [0..1]

      scan_ec2_instance_with_findings { # list [1..1]

        ebs_volumes { # list [1..1]
          enable = false  # bool | required

        }

      }

    }

    s3_logs { # list [0..1]
      enable = false  # bool | required

    }

  }

}

