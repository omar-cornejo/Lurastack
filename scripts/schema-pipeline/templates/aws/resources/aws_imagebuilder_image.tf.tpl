# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_image                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_image" "this" {

  infrastructure_configuration_arn = ""     # string | required
  container_recipe_arn             = ""     # string | optional
  distribution_configuration_arn   = ""     # string | optional
  enhanced_image_metadata_enabled  = false  # bool | optional
  execution_role                   = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  image_recipe_arn                 = ""     # string | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # date_created                     = ""     # string | computed
  # name                             = ""     # string | computed
  # os_version                       = ""     # string | computed
  # output_resources = [  # list(object)
  #   {
  #     amis = [  # set(object)
  #       {
  #         account_id = ""
  #         description = ""
  #         image = ""
  #         name = ""
  #         region = ""
  #       }
  #     ]
  #     containers = [  # set(object)
  #       {
  #         image_uris = []  # set(string)
  #         region = ""
  #       }
  #     ]
  #   }
  # ]
  # platform                         = ""     # string | computed
  # version                          = ""     # string | computed

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

  timeouts { # single
    create = ""     # string | optional

  }

  workflow { # set
    workflow_arn   = ""     # string | required
    on_failure     = ""     # string | optional
    parallel_group = ""     # string | optional

    parameter { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

}

