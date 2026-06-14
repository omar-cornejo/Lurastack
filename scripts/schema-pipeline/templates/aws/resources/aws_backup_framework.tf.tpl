# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_framework                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_framework" "this" {

  name              = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # creation_time     = ""     # string | computed
  # deployment_status = ""     # string | computed
  # status            = ""     # string | computed

  control { # set [1..*]
    name = ""     # string | required

    input_parameter { # set
      name  = ""     # string | optional
      value = ""     # string | optional

    }

    scope { # list [0..1]
      compliance_resource_ids   = []     # set(string) | optional+computed
      compliance_resource_types = []     # set(string) | optional+computed
      tags                      = {}     # map(string) | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

