# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_backup_framework                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_backup_framework" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # control = [  # list(object)
  #   {
  #     input_parameter = [  # list(object)
  #       {
  #         name = ""
  #         value = ""
  #       }
  #     ]
  #     name = ""
  #     scope = [  # list(object)
  #       {
  #         compliance_resource_ids = []  # list(string)
  #         compliance_resource_types = []  # list(string)
  #         tags = {}  # map(string)
  #       }
  #     ]
  #   }
  # ]
  # creation_time     = ""     # string | computed
  # deployment_status = ""     # string | computed
  # description       = ""     # string | computed
  # status            = ""     # string | computed

}

