# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_auditmanager_framework                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_auditmanager_framework" "this" {

  framework_type  = ""     # string | required
  name            = ""     # string | required

  # arn             = ""     # string | computed
  # compliance_type = ""     # string | computed
  # description     = ""     # string | computed
  # id              = ""     # string | computed
  # tags            = {}     # map(string) | computed

  control_sets { # set

    # id   = ""     # string | computed
    # name = ""     # string | computed

    controls { # set

      # id = ""     # string | computed

    }

  }

}

