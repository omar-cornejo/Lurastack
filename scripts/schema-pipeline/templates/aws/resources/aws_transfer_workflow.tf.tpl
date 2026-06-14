# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_workflow                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_workflow" "this" {

  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  on_exception_steps { # list [0..8]
    type = ""     # string | required

    copy_step_details { # list [0..1]
      name                 = ""     # string | optional
      overwrite_existing   = ""     # string | optional
      source_file_location = ""     # string | optional

      destination_file_location { # list [0..1]

        efs_file_location { # list [0..1]
          file_system_id = ""     # string | optional
          path           = ""     # string | optional

        }

        s3_file_location { # list [0..1]
          bucket = ""     # string | optional
          key    = ""     # string | optional

        }

      }

    }

    custom_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional
      target               = ""     # string | optional
      timeout_seconds      = 0      # number | optional

    }

    decrypt_step_details { # list [0..1]
      type                 = ""     # string | required
      name                 = ""     # string | optional
      overwrite_existing   = ""     # string | optional
      source_file_location = ""     # string | optional

      destination_file_location { # list [0..1]

        efs_file_location { # list [0..1]
          file_system_id = ""     # string | optional
          path           = ""     # string | optional

        }

        s3_file_location { # list [0..1]
          bucket = ""     # string | optional
          key    = ""     # string | optional

        }

      }

    }

    delete_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional

    }

    tag_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional

      tags { # list [0..10]
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

  }

  steps { # list [1..8]
    type = ""     # string | required

    copy_step_details { # list [0..1]
      name                 = ""     # string | optional
      overwrite_existing   = ""     # string | optional
      source_file_location = ""     # string | optional

      destination_file_location { # list [0..1]

        efs_file_location { # list [0..1]
          file_system_id = ""     # string | optional
          path           = ""     # string | optional

        }

        s3_file_location { # list [0..1]
          bucket = ""     # string | optional
          key    = ""     # string | optional

        }

      }

    }

    custom_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional
      target               = ""     # string | optional
      timeout_seconds      = 0      # number | optional

    }

    decrypt_step_details { # list [0..1]
      type                 = ""     # string | required
      name                 = ""     # string | optional
      overwrite_existing   = ""     # string | optional
      source_file_location = ""     # string | optional

      destination_file_location { # list [0..1]

        efs_file_location { # list [0..1]
          file_system_id = ""     # string | optional
          path           = ""     # string | optional

        }

        s3_file_location { # list [0..1]
          bucket = ""     # string | optional
          key    = ""     # string | optional

        }

      }

    }

    delete_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional

    }

    tag_step_details { # list [0..1]
      name                 = ""     # string | optional
      source_file_location = ""     # string | optional

      tags { # list [0..10]
        key   = ""     # string | required
        value = ""     # string | required

      }

    }

  }

}

