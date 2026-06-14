# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_document_ai_warehouse_document_schema        │
# └──────────────────────────────────────────────────────────────┘
resource "google_document_ai_warehouse_document_schema" "this" {

  display_name       = ""     # string | required | Name of the schema given by the user.
  location           = ""     # string | required | The location of the resource.
  project_number     = ""     # string | required | The unique identifier of the project.
  document_is_folder = false  # bool | optional | Tells whether the document is a folder or a typical document…
  id                 = ""     # string | optional+computed

  # name               = ""     # string | computed | The resource name of the document schema.

  property_definitions { # list [1..*]
    name                 = ""     # string | required | The name of the metadata property.
    display_name         = ""     # string | optional | The display-name for the property, used for front-end.
    is_filterable        = false  # bool | optional | Whether the property can be filtered. If this is a sub-prope…
    is_metadata          = false  # bool | optional | Whether the property is user supplied metadata.
    is_repeatable        = false  # bool | optional | Whether the property can have multiple values.
    is_required          = false  # bool | optional | Whether the property is mandatory.
    is_searchable        = false  # bool | optional | Indicates that the property should be included in a global s…
    retrieval_importance = ""     # string | optional | Stores the retrieval importance. Possible values: ["HIGHEST"…

    date_time_type_options {} # list [0..1]

    enum_type_options { # list [0..1]
      possible_values           = []     # list(string) | required | List of possible enum values.
      validation_check_disabled = false  # bool | optional | Make sure the enum property value provided in the document i…

    }

    float_type_options {} # list [0..1]

    integer_type_options {} # list [0..1]

    map_type_options {} # list [0..1]

    property_type_options { # list [0..1]

      property_definitions { # list [1..*]
        name                 = ""     # string | required | The name of the metadata property.
        display_name         = ""     # string | optional | The display-name for the property, used for front-end.
        is_filterable        = false  # bool | optional | Whether the property can be filtered. If this is a sub-prope…
        is_metadata          = false  # bool | optional | Whether the property is user supplied metadata.
        is_repeatable        = false  # bool | optional | Whether the property can have multiple values.
        is_required          = false  # bool | optional | Whether the property is mandatory.
        is_searchable        = false  # bool | optional | Indicates that the property should be included in a global s…
        retrieval_importance = ""     # string | optional | Stores the retrieval importance. Possible values: ["HIGHEST"…

        date_time_type_options {} # list [0..1]

        enum_type_options { # list [0..1]
          possible_values           = []     # list(string) | required | List of possible enum values.
          validation_check_disabled = false  # bool | optional | Make sure the enum property value provided in the document i…

        }

        float_type_options {} # list [0..1]

        integer_type_options {} # list [0..1]

        map_type_options {} # list [0..1]

        schema_sources { # list
          name           = ""     # string | optional | The schema name in the source.
          processor_type = ""     # string | optional | The Doc AI processor type name.

        }

        text_type_options {} # list [0..1]

        timestamp_type_options {} # list [0..1]

      }

    }

    schema_sources { # list
      name           = ""     # string | optional | The schema name in the source.
      processor_type = ""     # string | optional | The Doc AI processor type name.

    }

    text_type_options {} # list [0..1]

    timestamp_type_options {} # list [0..1]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

