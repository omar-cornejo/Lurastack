# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_configuration_recorder                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_configuration_recorder" "this" {

  role_arn = ""     # string | required
  id       = ""     # string | optional+computed
  name     = ""     # string | optional

  recording_group { # list [0..1]
    all_supported                 = false  # bool | optional
    include_global_resource_types = false  # bool | optional
    resource_types                = []     # set(string) | optional

    exclusion_by_resource_types { # list
      resource_types = []     # set(string) | optional

    }

    recording_strategy { # list
      use_only = ""     # string | optional

    }

  }

  recording_mode { # list [0..1]
    recording_frequency = ""     # string | optional

    recording_mode_override { # list [0..1]
      recording_frequency = ""     # string | required
      resource_types      = []     # set(string) | required
      description         = ""     # string | optional

    }

  }

}

