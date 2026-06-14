# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_image_recipe                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_image_recipe" "this" {

  name              = ""     # string | required
  parent_image      = ""     # string | required
  version           = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  user_data_base64  = ""     # string | optional+computed
  working_directory = ""     # string | optional

  # arn               = ""     # string | computed
  # date_created      = ""     # string | computed
  # owner             = ""     # string | computed
  # platform          = ""     # string | computed

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

  component { # list [1..*]
    component_arn = ""     # string | required

    parameter { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  systems_manager_agent { # list [0..1]
    uninstall_after_build = false  # bool | required

  }

}

