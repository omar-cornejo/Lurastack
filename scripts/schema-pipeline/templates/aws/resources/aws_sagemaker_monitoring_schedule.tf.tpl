# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_monitoring_schedule                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_monitoring_schedule" "this" {

  id       = ""     # string | optional+computed
  name     = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  monitoring_schedule_config { # list [1..1]
    monitoring_job_definition_name = ""     # string | required
    monitoring_type                = ""     # string | required

    schedule_config { # list [0..1]
      schedule_expression = ""     # string | required

    }

  }

}

