# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dataexchange_event_action                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dataexchange_event_action" "this" {


  # arn        = ""     # string | computed
  # created_at = ""     # string | computed
  # id         = ""     # string | computed
  # updated_at = ""     # string | computed

  action { # list

    export_revision_to_s3 { # list

      encryption { # list
        kms_key_arn = ""     # string | optional
        type        = ""     # string | optional

      }

      revision_destination { # list
        bucket      = ""     # string | required
        key_pattern = ""     # string | optional+computed

      }

    }

  }

  event { # list

    revision_published { # list
      data_set_id = ""     # string | required

    }

  }

}

