# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_provisioning_artifacts               │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_provisioning_artifacts" "this" {

  product_id                    = ""     # string | required
  accept_language               = ""     # string | optional
  id                            = ""     # string | optional+computed

  # provisioning_artifact_details = [  # list(object)
  #   {
  #     active = false
  #     created_time = ""
  #     description = ""
  #     guidance = ""
  #     id = ""
  #     name = ""
  #     type = ""
  #   }
  # ]

  timeouts { # single
    read = ""     # string | optional

  }

}

