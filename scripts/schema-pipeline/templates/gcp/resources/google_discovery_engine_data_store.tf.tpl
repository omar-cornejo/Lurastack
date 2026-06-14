# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_discovery_engine_data_store                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_discovery_engine_data_store" "this" {

  content_config               = ""     # string | required | The content config of the data store. Possible values: ["NO_…
  data_store_id                = ""     # string | required | The unique id of the data store.
  display_name                 = ""     # string | required | The display name of the data store. This field must be a UTF…
  industry_vertical            = ""     # string | required | The industry vertical that the data store registers. Possibl…
  location                     = ""     # string | required | The geographic location where the data store should reside. …
  create_advanced_site_search  = false  # bool | optional | If true, an advanced data store for site search will be crea…
  id                           = ""     # string | optional+computed
  project                      = ""     # string | optional+computed
  skip_default_schema_creation = false  # bool | optional | A boolean flag indicating whether to skip the default schema…
  solution_types               = []     # list(string) | optional | The solutions that the data store enrolls. Possible values: …

  # create_time                  = ""     # string | computed | Timestamp when the DataStore was created.
  # default_schema_id            = ""     # string | computed | The id of the default Schema associated with this data store…
  # name                         = ""     # string | computed | The unique full resource name of the data store. Values are …

  document_processing_config { # list [0..1]

    # name = ""     # string | computed | The full resource name of the Document Processing Config. Fo…

    default_parsing_config { # list [0..1]

      digital_parsing_config {} # list [0..1]

      ocr_parsing_config { # list [0..1]
        use_native_text = false  # bool | optional | If true, will use native text instead of OCR text on pages c…

      }

    }

    parsing_config_overrides { # set
      file_type = ""     # string | required

      digital_parsing_config {} # list [0..1]

      ocr_parsing_config { # list [0..1]
        use_native_text = false  # bool | optional | If true, will use native text instead of OCR text on pages c…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

