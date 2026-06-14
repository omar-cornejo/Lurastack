# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_pipeline                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_pipeline" "this" {

  pipeline_display_name = ""     # string | required
  pipeline_name         = ""     # string | required
  id                    = ""     # string | optional+computed
  pipeline_definition   = ""     # string | optional
  pipeline_description  = ""     # string | optional
  role_arn              = ""     # string | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed

  parallelism_configuration { # list [0..1]
    max_parallel_execution_steps = 0      # number | required

  }

  pipeline_definition_s3_location { # list [0..1]
    bucket     = ""     # string | required
    object_key = ""     # string | required
    version_id = ""     # string | optional

  }

}

