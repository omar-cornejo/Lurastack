# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_mq_broker_instance_type_offerings                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_mq_broker_instance_type_offerings" "this" {

  engine_type             = ""     # string | optional
  host_instance_type      = ""     # string | optional
  id                      = ""     # string | optional+computed
  storage_type            = ""     # string | optional

  # broker_instance_options = [  # list(object)
  #   {
  #     availability_zones = [  # set(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #     engine_type = ""
  #     host_instance_type = ""
  #     storage_type = ""
  #     supported_deployment_modes = []  # set(string)
  #     supported_engine_versions = []  # list(string)
  #   }
  # ]

}

