# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_instance_access_control_attributes     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_instance_access_control_attributes" "this" {

  instance_arn  = ""     # string | required
  id            = ""     # string | optional+computed

  # status        = ""     # string | computed
  # status_reason = ""     # string | computed

  attribute { # set [1..*]
    key = ""     # string | required

    value { # set [1..*]
      source = []     # set(string) | required

    }

  }

}

