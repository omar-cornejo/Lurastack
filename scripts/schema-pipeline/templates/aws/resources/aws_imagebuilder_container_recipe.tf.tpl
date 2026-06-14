# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_container_recipe                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_container_recipe" "this" {

  container_type           = ""     # string | required
  name                     = ""     # string | required
  parent_image             = ""     # string | required
  version                  = ""     # string | required
  description              = ""     # string | optional
  dockerfile_template_data = ""     # string | optional+computed
  dockerfile_template_uri  = ""     # string | optional
  id                       = ""     # string | optional+computed
  kms_key_id               = ""     # string | optional
  platform_override        = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  working_directory        = ""     # string | optional

  # arn                      = ""     # string | computed
  # date_created             = ""     # string | computed
  # encrypted                = false  # bool | computed
  # owner                    = ""     # string | computed
  # platform                 = ""     # string | computed

  component { # list [1..*]
    component_arn = ""     # string | required

    parameter { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  instance_configuration { # list [0..1]
    image = ""     # string | optional

    block_device_mapping { # set
      device_name  = ""     # string | optional
      no_device    = false  # bool | optional+computed
      virtual_name = ""     # string | optional

      ebs { # list [0..1]
        delete_on_termination = ""     # string | optional
        encrypted             = ""     # string | optional
        iops                  = 0      # number | optional
        kms_key_id            = ""     # string | optional
        snapshot_id           = ""     # string | optional
        throughput            = 0      # number | optional
        volume_size           = 0      # number | optional
        volume_type           = ""     # string | optional

      }

    }

  }

  target_repository { # list [1..1]
    repository_name = ""     # string | required
    service         = ""     # string | required

  }

}

