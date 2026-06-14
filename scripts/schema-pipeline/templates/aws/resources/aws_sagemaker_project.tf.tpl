# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_project                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_project" "this" {

  project_name        = ""     # string | required
  id                  = ""     # string | optional+computed
  project_description = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # project_id          = ""     # string | computed

  service_catalog_provisioning_details { # list [1..1]
    product_id               = ""     # string | required
    path_id                  = ""     # string | optional
    provisioning_artifact_id = ""     # string | optional+computed

    provisioning_parameter { # list
      key   = ""     # string | required
      value = ""     # string | optional

    }

  }

}

