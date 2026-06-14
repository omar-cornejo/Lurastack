# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_organization_configuration            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_organization_configuration" "this" {

  detector_id                      = ""     # string | required
  auto_enable                      = false  # bool | optional+computed+DEPRECATED
  auto_enable_organization_members = ""     # string | optional+computed
  id                               = ""     # string | optional+computed

  datasources { # list [0..1]

    kubernetes { # list [0..1]

      audit_logs { # list [1..1]
        enable = false  # bool | required

      }

    }

    malware_protection { # list [0..1]

      scan_ec2_instance_with_findings { # list [1..1]

        ebs_volumes { # list [1..1]
          auto_enable = false  # bool | required

        }

      }

    }

    s3_logs { # list [0..1]
      auto_enable = false  # bool | required

    }

  }

}

