# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_loss_prevention_stored_info_type        │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_loss_prevention_stored_info_type" "this" {

  parent              = ""     # string | required | The parent of the info type in any of the following formats:…
  description         = ""     # string | optional | A description of the info type.
  display_name        = ""     # string | optional | User set display name of the info type.
  id                  = ""     # string | optional+computed
  stored_info_type_id = ""     # string | optional+computed | The storedInfoType ID can contain uppercase and lowercase le…

  # name                = ""     # string | computed | The resource name of the info type. Set by the server.

  dictionary { # list [0..1]

    cloud_storage_path { # list [0..1]
      path = ""     # string | required | A url representing a file or path (no wildcards) in Cloud St…

    }

    word_list { # list [0..1]
      words = []     # list(string) | required | Words or phrases defining the dictionary. The dictionary mus…

    }

  }

  large_custom_dictionary { # list [0..1]

    big_query_field { # list [0..1]

      field { # list [1..1]
        name = ""     # string | required | Name describing the field.

      }

      table { # list [1..1]
        dataset_id = ""     # string | required | The dataset ID of the table.
        project_id = ""     # string | required | The Google Cloud Platform project ID of the project containi…
        table_id   = ""     # string | required | The name of the table.

      }

    }

    cloud_storage_file_set { # list [0..1]
      url = ""     # string | required | The url, in the format 'gs://<bucket>/<path>'. Trailing wild…

    }

    output_path { # list [1..1]
      path = ""     # string | required | A url representing a file or path (no wildcards) in Cloud St…

    }

  }

  regex { # list [0..1]
    pattern       = ""     # string | required | Pattern defining the regular expression. Its syntax (https:/…
    group_indexes = []     # list(number) | optional | The index of the submatch to extract as findings. When not s…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

