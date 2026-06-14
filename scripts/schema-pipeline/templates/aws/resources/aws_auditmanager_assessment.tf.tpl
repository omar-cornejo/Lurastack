# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_assessment                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_assessment" "this" {

  framework_id = ""     # string | required
  name         = ""     # string | required
  roles        = []     # set(object({ role_arn: string, role_type: string })) | required
  description  = ""     # string | optional
  tags         = {}     # map(string) | optional

  # arn          = ""     # string | computed
  # id           = ""     # string | computed
  # roles_all = [  # set(object)
  #   {
  #     role_arn = ""
  #     role_type = ""
  #   }
  # ]
  # status       = ""     # string | computed
  # tags_all     = {}     # map(string) | computed

  assessment_reports_destination { # list
    destination      = ""     # string | required
    destination_type = ""     # string | required

  }

  scope { # list

    aws_accounts { # set
      id = ""     # string | required

    }

    aws_services { # set
      service_name = ""     # string | required

    }

  }

}

