# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_framework                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_framework" "this" {

  name            = ""     # string | required
  compliance_type = ""     # string | optional
  description     = ""     # string | optional
  tags            = {}     # map(string) | optional

  # arn             = ""     # string | computed
  # framework_type  = ""     # string | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

  control_sets { # set
    name = ""     # string | required

    # id   = ""     # string | computed

    controls { # set
      id = ""     # string | required

    }

  }

}

