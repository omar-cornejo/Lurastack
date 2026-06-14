# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_indexing_configuration                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_indexing_configuration" "this" {

  id = ""     # string | optional+computed

  thing_group_indexing_configuration { # list [0..1]
    thing_group_indexing_mode = ""     # string | required

    custom_field { # set
      name = ""     # string | optional
      type = ""     # string | optional

    }

    managed_field { # set
      name = ""     # string | optional
      type = ""     # string | optional

    }

  }

  thing_indexing_configuration { # list [0..1]
    thing_indexing_mode              = ""     # string | required
    device_defender_indexing_mode    = ""     # string | optional
    named_shadow_indexing_mode       = ""     # string | optional
    thing_connectivity_indexing_mode = ""     # string | optional

    custom_field { # set
      name = ""     # string | optional
      type = ""     # string | optional

    }

    filter { # list [0..1]
      named_shadow_names = []     # set(string) | optional

    }

    managed_field { # set
      name = ""     # string | optional
      type = ""     # string | optional

    }

  }

}

