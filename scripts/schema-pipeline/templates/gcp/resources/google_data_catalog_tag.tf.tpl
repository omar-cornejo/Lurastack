# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_tag                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_tag" "this" {

  template             = ""     # string | required | The resource name of the tag template that this tag uses. Ex…
  column               = ""     # string | optional | Resources like Entry can have schemas associated with them. …
  id                   = ""     # string | optional+computed
  parent               = ""     # string | optional | The name of the parent this tag is attached to. This can be …

  # name                 = ""     # string | computed | The resource name of the tag in URL format. Example: project…
  # template_displayname = ""     # string | computed | The display name of the tag template.

  fields { # set [1..*]
    field_name      = ""     # string | required
    bool_value      = false  # bool | optional | Holds the value for a tag field with boolean type.
    double_value    = 0      # number | optional | Holds the value for a tag field with double type.
    enum_value      = ""     # string | optional | The display name of the enum value.
    string_value    = ""     # string | optional | Holds the value for a tag field with string type.
    timestamp_value = ""     # string | optional | Holds the value for a tag field with timestamp type.

    # display_name    = ""     # string | computed | The display name of this field
    # order           = 0      # number | computed | The order of this field with respect to other fields in this…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

