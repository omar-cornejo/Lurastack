# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_tag_template                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_tag_template" "this" {

  tag_template_id = ""     # string | required | The id of the tag template to create.
  display_name    = ""     # string | optional | The display name for this template.
  force_delete    = false  # bool | optional | This confirms the deletion of any possible tags using this t…
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed
  region          = ""     # string | optional+computed | Template location region.

  # name            = ""     # string | computed | The resource name of the tag template in URL format. Example…

  fields { # set [1..*]
    field_id     = ""     # string | required
    description  = ""     # string | optional+computed | A description for this field.
    display_name = ""     # string | optional+computed | The display name for this field.
    is_required  = false  # bool | optional+computed | Whether this is a required field. Defaults to false.
    order        = 0      # number | optional+computed | The order of this field with respect to other fields in this…

    # name         = ""     # string | computed | The resource name of the tag template field in URL format. E…

    type { # list [1..1]
      primitive_type = ""     # string | optional+computed | Represents primitive types - string, bool etc.  Exactly one …

      enum_type { # list [0..1]

        allowed_values { # set [1..*]
          display_name = ""     # string | required | The display name of the enum value.

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

