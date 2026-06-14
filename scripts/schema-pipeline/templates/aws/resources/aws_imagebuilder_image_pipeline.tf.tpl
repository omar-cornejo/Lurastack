# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_image_pipeline                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_image_pipeline" "this" {

  infrastructure_configuration_arn = ""     # string | required
  name                             = ""     # string | required
  container_recipe_arn             = ""     # string | optional
  description                      = ""     # string | optional
  distribution_configuration_arn   = ""     # string | optional
  enhanced_image_metadata_enabled  = false  # bool | optional
  execution_role                   = ""     # string | optional
  id                               = ""     # string | optional+computed
  image_recipe_arn                 = ""     # string | optional
  status                           = ""     # string | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # date_created                     = ""     # string | computed
  # date_last_run                    = ""     # string | computed
  # date_next_run                    = ""     # string | computed
  # date_updated                     = ""     # string | computed
  # platform                         = ""     # string | computed

  image_scanning_configuration { # list [0..1]
    image_scanning_enabled = false  # bool | optional

    ecr_configuration { # list [0..1]
      container_tags  = []     # set(string) | optional
      repository_name = ""     # string | optional

    }

  }

  image_tests_configuration { # list [0..1]
    image_tests_enabled = false  # bool | optional
    timeout_minutes     = 0      # number | optional

  }

  schedule { # list [0..1]
    schedule_expression                = ""     # string | required
    pipeline_execution_start_condition = ""     # string | optional
    timezone                           = ""     # string | optional+computed

  }

  workflow { # list
    workflow_arn   = ""     # string | required
    on_failure     = ""     # string | optional
    parallel_group = ""     # string | optional

    parameter { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

}

